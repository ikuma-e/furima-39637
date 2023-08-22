class ApplicationController < ActionController::Base
  before_action :basic_auth

  # deviseコントローラー限定の処理
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  # 新規登録の処理にパラメータを新たに追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :family_name, :family_name_kana, :first_name, :first_name_kana,
                                             :user_birth])
  end
end
