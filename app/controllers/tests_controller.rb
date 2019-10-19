class TestsController < ApplicationController
  before_action :init_test
  before_action :get_user, only:  %i(index)

  def index
    if @user
      @tests = user.tests
      authorize @tests
    else
      render :error, status: :unprocessable_entity
    end
  end

  def create
    authorize @test
    @test = current_user.tests.build test_params
    if @test.save
      render :create, status: :created
    else
      render :error, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def get_user
    @user = User.find_by id: params[:user_id]
  end

  def test_params
    params.require(:test).permit :name, :description, :language_id, :category_id
  end

  def init_test
    @test = Test.new
  end
end
