class Public::FriendsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    if params[:search]
      @search = params[:search]
      case @search
      when "is_rank" then
        @friends = Friend.where(is_rank: true)
      when "is_normal" then
        @friends = Friend.where(is_normal: true)
      when "is_beginner" then
        @friends = Friend.where(is_beginner: true)
      when "is_coaching" then
        @friends = Friend.where(is_coaching: true)
      when "is_coached" then
        @friends = Friend.where(is_coached: true)
      when "is_clash" then
        @friends = Friend.where(is_clash: true)
      else
        @friends = Friend.all
      end
    else
      @friends = Friend.all
    end
  end

  def search
    @q = Friend.ransack(params[:q])
    @friends = @q.result(distinct: true)
  end

  def new
    if Friend.find_by(user_id: current_user.id)
      @user = User.find(current_user.id)
      redirect_to edit_public_friend_path(@user), info: "すでに投稿済みです"
    else
      @friend = Friend.new
    end
  end

  def create
    @friend = current_user.friends.new(friend_params)
    @friend.user_id = current_user.id
    if @friend.save
      redirect_to public_friends_path, success: "投稿しました"
    else
      render "new"
    end
  end

  def edit
    @friend = Friend.find_by(user_id: current_user.id)
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find_by(user_id: current_user.id)
    if @friend.update(friend_params)
      redirect_to public_friends_path, success: "更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @friend = Friend.find_by(user_id: current_user.id)
    @friend.destroy
    redirect_to public_friends_path, success: "投稿を削除しました"
  end

  private

  def friend_params
    params.require(:friend).permit(:favorite_champion, :introduction, :rank, :is_rank, :is_normal, :is_beginner, :is_coaching, :is_coached, :is_clash, :good_at_top, :good_at_jg, :good_at_mid, :good_at_adc, :good_at_sup, :bad_at_top, :bad_at_jg, :bad_at_mid, :bad_at_adc, :bad_at_sup, :active_time, :twitter, :vc_status, :vc_discord, :vc_skype, :vc_leaguevoice)
  end
end
