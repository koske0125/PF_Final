class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger #flashメッセージのキーを追加
  before_action :configure_permitted_parameters, if: :devise_controller? #deviseストロングパラメーターの設定

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :summoner_name, :is_published, :authenticate, :is_deleted])
  end

end
