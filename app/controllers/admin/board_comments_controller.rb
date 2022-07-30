class Admin::BoardCommentsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @board_comment = BoardComment.find(params[:id])
  end

  def update
    @board_comment = BoardComment.find(params[:id])
    @board = @board_comment.board
    @board_comment.update(board_comment_params)
    redirect_to admin_board_path(@board), success: "コメントを編集しました"
  end

  def destroy
    @board_comment = BoardComment.find(params[:id])
    @board = @board_comment.board
    @board_comment.destroy
    redirect_to admin_board_path(@board), success: "コメントを削除しました"
  end

  private

  def board_comment_params
    params.require(:board_comment).permit(:body, :board_comments_image)
  end

end
