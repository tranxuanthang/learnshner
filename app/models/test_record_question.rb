class TestRecordQuestion < ApplicationRecord
  belongs_to :record
  belongs_to :question
end
