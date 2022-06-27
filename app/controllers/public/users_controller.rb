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
    if @user.update(user_params)
      redirect_to public_user_path(@user.id), success: "プロフィールを更新しました"
    else
      render "edit"
    end
  end


  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :summoner_name, :email, :is_published, :password)
  end

end
