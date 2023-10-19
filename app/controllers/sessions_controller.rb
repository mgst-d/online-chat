class SessionsController < ApplicationController

  def create
    
    user = User.find_by(username: params[:session][:username])
    if user
      log_in(user)
    else
      user = User.create(username: params[:session][:username])
      log_in(user)
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end