class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom # Add this line
  end
  # [...]
  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    authorize @chatroom
  end
end
