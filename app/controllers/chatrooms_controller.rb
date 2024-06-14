class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :new, :create]

  def show
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

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
