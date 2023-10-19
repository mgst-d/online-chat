class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/sign_in' unless @current_user
    @rooms = Room.all
    @room = Room.new

    # @user = User.find(params[:user_id])
  end
  def create
    @room = Room.create(name: params["room"]["name"])
  end
  def show
    @current_user = current_user
    @rooms = Room.all
    @room = Room.new
    @single_room = Room.find(params[:id])
    @message = Message.new
    @users = User.all
    @messages = @single_room.messages
    render "index"
  end
end
