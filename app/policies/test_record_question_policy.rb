class TestRecordQuestionPolicy < ApplicationPolicy
  attr_reader :user, :test_record_question

  def initialize(user, test_record_question)
    @user = user
    @test_record_question = test_record_question
  end

  def index?
    user.present?
  end

  def show?
    user.present? && (user.admin? || test_record_question.user == user)
  end

  def create?
    user.present? && (user.admin? || test_record_question.user == user)
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.admin? || test_record_question.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (user.admin? || test_record_question.user == user)
  end
end
