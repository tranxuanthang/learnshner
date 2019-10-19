class UserController < ApplicationController
  def index
    @user = current_user
    render :error unless @user
  end
end
