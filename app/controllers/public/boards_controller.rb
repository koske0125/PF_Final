class Public::BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @boards = Board.all.order(updated_at: :desc)
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to public_board_path(@board), success: "投稿しました"
    else
      render "index"
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end

end
