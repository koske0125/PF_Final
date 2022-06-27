# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create] #ログイン処理前にuser_stateメソッドを呼び出す

  protected

  def user_state #退会ステータス確認用のメソッド
    @user = User.find_by(email: params[:user][:email]) #ユーザーモデルから受け取ったメールアドレスに合致するレコードを探す
    return if !@user #合致するレコードがなかった場合、メソッドを終了する
    if @user.valid_password?(params[:user][:password]) #取得したレコードのパスワードが入力されたパスワードと一致しているかを判別
      if @user.is_deleted == true
        redirect_to new_user_registration_path, danger: "退会済みのユーザーです。再度ご利用の場合は新規登録を行ってください"
      end
    end
  end
end
