class Test < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :category
end
