class TestPolicy < ApplicationPolicy
  attr_reader :user, :test

  def initialize(user, test)
    @user = user
    @test = test
  end

  def index?
    true
  end

  def show?
    user.present?

  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && user == test.user
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (user.admin? || test.user == user)
  end
end
