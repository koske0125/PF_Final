class Admin::ClubBoardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @boards = ClubBoard.all.order(updated_at: :desc).page(params[:page]).per(20)
  end

  def show
    @board = ClubBoard.find(params[:id])
    @board_comments = @board.club_board_comments.page(params[:page]).per(10)
  end

  def edit
    @board = ClubBoard.find(params[:id])
  end

  def update
    @board = ClubBoard.find(params[:id])
    @board.update(club_boards_params)
    redirect_to admin_club_board_path(@board), success: "ボードを編集しました"
  end

  def destroy
    @board = ClubBoard.find(params[:id])
    @board.destroy
    redirect_to admin_club_boards_path, success: "ボードを削除しました"
  end

  private

  def club_boards_params
    params.require(:club_board).permit(:title, :body, :club_board_image)
  end

end
