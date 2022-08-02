class EntitiesController < ApplicationController
  def index

  end

  def new
  @user=current_user
  @entity=Entity.new
  end
end
