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
    @club_board = ClubBoard.new
    @club_boards = @club.club_boards
  end

  def edit
    @club = Club.find(params[:id])
    if @club.user = current_user
      render "edit"
    else
      redirect_to public_club_path(@club), danger: "不正なアクセスです"
    end
  end

  def update
    @club = Club.find(params[:id])
    if @club.user = current_user
      @club.update(club_params)
      redirect_to public_club_path(@club), success: "サークル情報を更新しました"
    else
      redirect_to public_club_path(@club), danger: "不正なアクセスです"
    end
  end

  def destroy
    @club = Club.find(params[:id])
    if @club.user = current_user
      @club.destroy
      redirect_to public_clubs_path, success: "サークルを削除しました"
    else
      redirect_to public_club_path(@club), danger: "不正なアクセスです"
    end
  end



  private

  def club_params
    params.require(:club).permit(:name, :introduction)
  end

end
