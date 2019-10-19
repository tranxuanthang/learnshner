class User < ApplicationRecord
  authenticates_with_sorcery!
  has_secure_token :auth_token
  validates :email, uniqueness: true
  validates :password, confirmation: true
end
