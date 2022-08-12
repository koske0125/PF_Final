class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user = current_user
      if @user.update(user_params)
        redirect_to public_user_path(@user.id), success: "プロフィールを更新しました"
      else
        render "edit"
      end
    else
      redirect_to public_path, danger: "不正なアクセスです"
    end
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    if @user.friend
      @friend = @user.friend
      @friend.destroy
    end
    if @user.boards
      @boards = @user.boards
      @boards.each do |board|
        board.destroy
      end
    end
    if @user.board_comments
      @board_comments = @user.board_comments
      @board_comments.each do |board_comment|
        board_comment.destroy
      end
    end
    if @user.clubs
      @clubs = @user.clubs
      @clubs.each do |club|
        club.destroy
      end
    end
    if @user.club_members
      @club_members = @user.club_members
      @club_members.each do |club_member|
        club_member.destroy
      end
    end
    if @user.club_boards
      @club_boards = @user.club_boards
      @club_boards.each do |club_board|
        club_board.destroy
      end
    end
    reset_session
    redirect_to public_path, success: "退会処理を実行しました"
  end

  def followings
    user = User.find(current_user.id)
    @users = user.followings
  end

  def followers
    user = User.find(current_user.id)
    @users = user.followers
  end

  def clubs
    user = User.find(current_user.id)
    @clubs = user.club_members
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :summoner_name, :email, :is_published, :password)
  end

end
