class LanguagesController < ApplicationController
  before_action :init_language
  before_action :get_language, except: %i(index create)

  def index
    @languages = Language.all.order(:language_code)
    authorize @languages
  end

  def create
    @language = Language.new language_params
    authorize @language
    if @language.save
      render :language, status: :created
    else
      render :error, errors: @language.errors, status: :unprocessable_entity
    end
  end

  def show
    authorize @language
  end

  def update
    authorize @language
    if @language.update language_params
      render :language, status: :accepted
    else
      render :error, errors: @language.errors, status:  :unprocessable_entity
    end
  end

  def destroy
    authorize @language
    if @language.destroy
      render status: :accepted
    else
      render :error, errors: @language.errors, status:  :unprocessable_entity
    end
  end

  private
  def init_language
    @language = Language.new
  end

  def get_language
    @language = Language.find_by id: params[:id]
  end

  def language_params
    params.require(:language).permit :language_code
  end
end
