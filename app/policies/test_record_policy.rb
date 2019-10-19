class TestRecordPolicy < ApplicationPolicy
  attr_reader :user, :test_record

  def initialize(user, test_record)
    @user = user
    @test_record = test_record
  end

  def index?
    user.present?
  end

  def show?
    user.present? && (test_record.user == user || user.admin?)
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (test_record.user == user || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (test_record.user == user || user.admin?)
  end
end
