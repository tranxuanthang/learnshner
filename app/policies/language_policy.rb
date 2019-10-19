class LanguagePolicy < ApplicationPolicy
  attr_reader :user, :language

  def initialize(user, language)
    @user = user
    @language = language
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && user.admin?
  end

  def new?
    create?
  end

  def update?
    user.present? && user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.admin?
  end
end
