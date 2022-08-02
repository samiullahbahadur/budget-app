class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @group =Group.all
    @user=current_user
  end

  def new
  @user=current_user
  @group=Group.new
    
  end

  def create 
    @group=Group.new(group_params)
    @group.user=current_user
    if @group.save
      flash[:notice]="Category successfully created"
      redirect_to user_groups_path
    else
      render "new"
      flash[:alert]="somethings wrong"
    end
  end

  def destroy 
    @group= Group.find(params[:id])
    if @group.destroy
      flash[:notice]="Category successfully Deleted"
      redirect_to user_groups_path
    end
  end
  private 
  def group_params
    params.require(:group).permit(:name, :image)
  end
end
