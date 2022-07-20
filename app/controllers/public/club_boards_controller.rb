class Public::ClubBoardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @club = Club.find(params[:club_id])
    @club_board = @club.club_boards.build(club_boards_params)
    @club_board.user_id = current_user.id

    if @club_board.save
      redirect_to public_club_path(@club), success: "スレッドを作成しました"
    else
      #バリデーション不適合時のエラー処理を追記予定
    end
  end

  def show
    @club_board = ClubBoard.find(params[:club_id])
    @club_board_comments = @club_board.club_board_comments.page(params[:page]).per(10)
    @club_board_comment = ClubBoardComment.new
  end

  private

  def club_boards_params
    params.require(:club_board).permit(:title, :body, :club_board_image)
  end

end
