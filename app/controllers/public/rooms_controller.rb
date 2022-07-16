class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    #すでに共通のルームが存在するかを確認する
    @self = User.find(current_user.id)
    @partner = User.find(params[:partner_id])
    @self_entries = Entry.where(user_id: @self.id)
    @partner_entries = Entry.where(user_id: @partner)

    @self_entries.each do |self_entry|
      @partner_entries.each do |partner_entry|
        if self_entry.room_id == partner_entry.room_id then
          @room_id = self_entry.room_id
        end
      end
    end

    if @room_id
      @room = Room.find(@room_id)
      redirect_to public_room_messages_path(@room)
    else
      @room = Room.new(room_params)
      @room.name = current_user.name
      @room.save
      redirect_to public_room_messages_path(@room)
    end
  end

  private

  def room_params
    params.permit(user_ids: [])
  end

end
