class UsersController < ApplicationController
  def create
    @user = User.new user_params
    if @user.save
      render status: :created
    else
      @errors = @user.errors
      render :error, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
