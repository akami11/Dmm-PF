class ApplicationController < ActionController::Base
    before_action :authenticate_user!

  # ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource)
    foods_path 
  end
  
  # tipを表示する機能
  def tip_view
    @tip = Tip.find(Tip.pluck(:id).sample)
  end
  
end
