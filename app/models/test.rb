class Test < ApplicationRecord
  has_many :questions
  belongs_to :user
  belongs_to :language
  belongs_to :category

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if:  :reject_question

  delegate :id, :email, :name, to: :user, prefix: true, allow_nil: true
  delegate :id, :name, to: :category, prefix: true, allow_nil: true
  delegate :id, :language_code, to: :language, prefix: true, allow_nil: true

  def reject_question attributes
    attributes[:content].blank? || attributes[:answer].blank?
  end
end
