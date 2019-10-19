class ApplicationController < ActionController::API
  before_action :login_with_auth_token

  private
  def login_with_auth_token
    user_id = request.headers["user-id"]
    auth_token = request.headers["auth-token"]
    if user_id && auth_token
      user = User.find_by id: user_id, auth_token: auth_token
      auto_login user if user
    end
  end
end
