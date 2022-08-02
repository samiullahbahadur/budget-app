class EntitiesController < ApplicationController
  def index
   @groups = Group.find(params[:group_id])
    @entity = @groups.entities
      @total = 0
      @entity.each do |price|
      @total += price.amount
      end
  end

  def new
  @user=current_user
  @entity=Entity.new
  end

  def create 
    @entity =Entity.new(entity_params)
    @entity.user=current_user
    @entity.group=Group.find(params[:group_id])
    if @entity.save
      flash[:notice]= "Entity Successfully Created"
      redirect_to user_group_entities_path
    else
      flash[:alert]="something was wrong please try again"
      render 'new'
    end
  end
  def entity_params 
    params.require(:entity).permit(:name, :amount)
  end
end
