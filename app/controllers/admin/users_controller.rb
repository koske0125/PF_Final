class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, success: "ユーザー情報を更新しました"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :summoner_name, :email, :is_published, :password, :authenticate, :is_deleted)
  end

end
