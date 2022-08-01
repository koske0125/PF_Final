class Admin::ClubBoardCommentsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @board_comment = ClubBoardComment.find(params[:id])
  end

  def update
    @board_comment = ClubBoardComment.find(params[:id])
    @board = @board_comment.club_board
    @board_comment.update(club_board_comment_params)
    redirect_to admin_club_board_path(@board), success: "コメントを編集しました"
  end

  def destroy
    @board_comment = ClubBoardComment.find(params[:id])
    @board = @board_comment.club_board
    @board_comment.destroy
    redirect_to admin_club_board_path(@board), success: "コメントを削除しました"
  end

  private

  def club_board_comment_params
    params.require(:club_board_comment).permit(:body, :club_board_comments_image)
  end
end
