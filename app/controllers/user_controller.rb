class UserController < ApplicationController
  def index
    @user = current_user
    render :error, status: :unprocessable_entity unless @user
  end
end
