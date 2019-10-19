class UserSessionsController < ApplicationController
  def create
    @user = User.find_by email: params[:email]
    if @user.valid_password?(params[:password])
      render :create, status: :created
    else
      @errors = "Invalid login info"
      render :error, status: :unauthorized
    end
  end

  def destroy
    @user.regenerate_auth_token
    render status: :accepted
  end
end
