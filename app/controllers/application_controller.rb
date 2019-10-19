class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  include Pundit
  before_action :login_with_auth_token

  rescue_from Pundit::NotAuthorizedError, Pundit::NotDefinedError, with: :unauthorized_user

  private
  def unauthorized_user
    @errors = "You don't have permission or something wrong! Please try again!"
    render :error, status: :unauthorized
  end

  def login_with_auth_token
    auth_token = nil
    authenticate_with_http_token do |token, options|
      auth_token = token
    end
    if auth_token
      user = User.find_by auth_token: auth_token
      auto_login user if user
    end
  end
end
