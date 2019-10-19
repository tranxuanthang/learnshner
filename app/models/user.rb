class User < ApplicationRecord
  AUTHORITIES = {admin: "admin", member: "member"}.freeze
  enum role: AUTHORITIES

  authenticates_with_sorcery!
  has_secure_token :auth_token
  validates :email, uniqueness: true
  validates :password, confirmation: true

  has_many :tests
end
