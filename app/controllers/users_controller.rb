class UsersController < ApplicationController
  def new
  end
  def create
    user = User.find(params[:id])
    if user
      redirect_to root_path
    else
      render 'new'
    end
  end
end
