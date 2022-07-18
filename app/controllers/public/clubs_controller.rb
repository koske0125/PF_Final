class Public::ClubsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @clubs = Club.all.order(updated_at: :desc).page(params[:page]).per(20)
    @club = Club.new
  end

  def create
    @club = current_user.clubs.build(club_params)
    @clubs = Board.all.order(updated_at: :desc).page(params[:page]).per(20)
    if @club.save
      @owner = @club.club_members.new
      @owner.user_id = current_user.id
      @owner.save
      redirect_to public_club_path(@club), success: "サークルを作成しました"
    else
      render "index"
    end
  end

  def show
    @club = Club.find(params[:id])
    @members = @club.club_members
  end



  private

  def club_params
    params.require(:club).permit(:name, :introduction)
  end

end
