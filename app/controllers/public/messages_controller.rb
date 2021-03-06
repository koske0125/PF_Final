class Public::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @messages = @room.messages

    if @message.save

    else
      @messages = @room.messages.includes(:user)
      render "index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :message_image).merge(user_id: current_user.id)
  end

end
