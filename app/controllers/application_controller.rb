class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger #flashメッセージのキーを追加
end
