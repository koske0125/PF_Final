class Public::ClubBoardCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @club_board = ClubBoard.find(params[:id])
    @club = @club_board.club
    @club_board_comment = @club_board.club_board_comments.build(club_board_comments_params)
    @club_board_comment.user_id = current_user.id
    @club_board_comments = @club_board.club_board_comments.page(params[:page]).per(10)

    if @club_board_comment.save
      redirect_to public_club_path(@club), success: "コメントを投稿しました"
    else
      render template: "public/club_boards/show"
    end
  end

  private

  def club_board_comments_params
    params.require(:club_board_comment).permit(:body, :club_board_comments_image)
  end

end
