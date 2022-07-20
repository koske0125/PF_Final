class Public::BoardCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @board = Board.find(params[:board_id])
    @board_comment = @board.board_comments.build(board_comment_params)
    @board_comment.user_id = current_user.id
    @board_comments = @board.board_comments.page(params[:page]).per(10)

    if @board_comment.save
      redirect_to public_board_path(@board), success: "投稿しました"
    else
      render template: "public/boards/show"
    end
  end

  private

  def board_comment_params
    params.require(:board_comment).permit(:body, :board_comments_image)
  end

end
