class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new

    # @user = User.find(params[:user_id])
  end
  def create
    @room = Room.create(name: params["room"]["name"])
  end
end
