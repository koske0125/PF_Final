class Admin::MessagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @messages = Message.all
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_messages_path, success: "メッセージを削除しました"
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to admin_messages_path, success: "メッセージを編集しました"
  end

  def edit
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:message_image, :body)
  end

end
