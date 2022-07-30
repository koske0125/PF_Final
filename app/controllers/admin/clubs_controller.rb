class Admin::ClubsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @clubs = Club.all.order(updated_at: :desc).page(params[:page]).per(20)
  end

  def show
    @club = Club.find(params[:id])
    @members = @club.club_members
    @club_boards = @club.club_boards
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    @club.update(club_params)
    redirect_to admin_club_path(@club), success: "サークル情報を更新しました"
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy
    redirect_to admin_clubs_path, success: "サークルを削除しました"
  end

  private

  def club_params
    params.require(:club).permit(:name, :introduction)
  end

end
