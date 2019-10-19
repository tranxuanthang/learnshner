class CategoriesController < ApplicationController
  before_action :init_category
  before_action :get_category, except: %i(index create)

  def index
    @categories = Category.all.order(:name)
    authorize @categories
  end

  def create
    @category = Category.new category_params
    authorize @category
    if @category.save
      render :category, status: :created
    else
      render :error, errors: @category.errors, status: :unprocessable_entity
    end
  end

  def show
    authorize @category
  end

  def update
    authorize @category
    if @category.update category_params
      render :category, status: :accepted
    else
      render :error, errors: @category.errors, status:  :unprocessable_entity
    end
  end

  def destroy
    authorize @category
    if @category.destroy
      render status: :accepted
    else
      render :error, errors: @category.errors, status:  :unprocessable_entity
    end
  end

  private
  def init_category
    @category = Category.new
  end

  def get_category
    @category = Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit :name
  end
end
