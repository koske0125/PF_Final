class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.name = current_user.name
    @room.save
    redirect_to public_room_messages_path(@room)
  end

  private

  def room_params
    params.permit(user_ids: [])
  end

end
