class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friends = Friend.all.order(updated_at: :desc).page(params[:page]).per(6)
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || public_path
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || public_path
  end

end
