class GroupsController < ApplicationController
  def index
    @group =Group.all
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
  private 
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
