class ApplicationController < ActionController::Base
    before_action :authenticate_user!

  # ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource)
    foods_path 
  end
  
end
