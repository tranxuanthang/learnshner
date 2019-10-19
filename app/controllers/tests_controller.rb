class TestsController < ApplicationController
  before_action :init_test
  before_action :get_user, only:  %i(index)
  before_action :get_test, only:  %i(show update)

  def index
    if @user
      @tests = @user.tests.order(created_at: :desc).page(params[:page]).per(10)
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
    authorize @test
  end

  def update
    authorize @test
    if @test.update test_params
      render @test ,status: :accepted
    else
      render :error, @errors = @test.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @test
    if @test.destroy
      render status: :accepted
    else
      render :error, status: :unprocessable_entity
    end
  end

  private
  def get_user
    @user = User.find_by id: params[:user_id] || current_user
  end

  def test_params
    params.require(:test).permit :name, :description, :language_id, :category_id, questions_attributes: [:id, :content, :answer ]
  end

  def init_test
    @test = Test.new
  end

  def get_test
    @test = Test.find_by id: params[:id]
  end
end
