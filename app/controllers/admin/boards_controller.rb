class Admin::BoardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @boards = Board.all.order(updated_at: :desc).page(params[:page]).per(20)
  end

  def show
    @board = Board.find(params[:id])
    @board_comments = @board.board_comments.page(params[:page]).per(10)
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def bords_params
    params.require(:board).permit(:title, :body, :board_image)
  end

end
