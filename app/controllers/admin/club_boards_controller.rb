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
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(bords_params)
    redirect_to admin_board_path(@board), success: "ボードを編集しました"
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to admin_boards_path, success: "ボードを削除しました"
  end

  private

  def bords_params
    params.require(:board).permit(:title, :body, :board_image)
  end

end
