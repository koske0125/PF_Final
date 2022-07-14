class Public::BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @boards = Board.all.order(updated_at: :desc).page(params[:page]).per(20)
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    @boards = Board.all.order(updated_at: :desc).page(params[:page]).per(20)
    if @board.save
      redirect_to public_board_path(@board), success: "投稿しました"
    else
      render "index"
    end
  end

  def show
    @board = Board.find(params[:id])
    @board_comments = @board.board_comments.page(params[:page]).per(20)
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image)
  end

end
