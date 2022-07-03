class Admin::FriendsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @friends = Friend.all.order(updated_at: :desc)
  end

  def search
    @search_params = friend_search_params
    @friends = Friend.search(@search_params)
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
      redirect_to admin_friends_path, success: "更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to admin_friends_path, success: "投稿を削除しました"
  end

  private

  def friend_params
    params.require(:friend).permit(:favorite_champion, :introduction, :rank, :is_rank, :is_normal, :is_beginner, :is_coaching, :is_coached, :is_clash, :good_at_top, :good_at_jg, :good_at_mid, :good_at_adc, :good_at_sup, :bad_at_top, :bad_at_jg, :bad_at_mid, :bad_at_adc, :bad_at_sup, :active_time, :twitter, :vc_status, :vc_discord, :vc_skype, :vc_leaguevoice)
  end

  def friend_search_params
    params.fetch(:search, {}).permit(:rank, :is_rank, :is_normal, :is_beginner, :is_coaching, :is_coached, :is_clash, :good_at_top, :good_at_jg, :good_at_mid, :good_at_adc, :good_at_sup, :bad_at_top, :bad_at_jg, :bad_at_mid, :bad_at_adc, :bad_at_sup, :vc_status, :vc_discord, :vc_skype, :vc_leaguevoice, :sort_status)
  end
end
