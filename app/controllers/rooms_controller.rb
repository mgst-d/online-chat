class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    # @user = User.find(params[:user_id])
  end
end
