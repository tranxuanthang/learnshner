class BookmarksController < ApplicationController
  before_action :get_test, only: %i(create destroy)

  def index
    @bookmarkedtests = current_user.bookmarkedtests if current_user
    authorize @bookmarkedtests
    render status: :accepted
  end

  def create
    render status: :unprocessable_entity unless current_user and @test
    if current_user.bookmarks.create test_id: params[:test][:id]
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    render status: :unprocessable_entity unless current_user and @test
    if current_user.bookmarks.remove test_id: params[:test][:id]
      render status: :accepted
    else
      render status: :unprocessable_entity
    end
  end

  private
  def get_test
    @test = Test.find_by id: params[:id]
  end
end
