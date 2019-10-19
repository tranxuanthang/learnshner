class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  AUTHORITIES = {admin: "admin", member: "member"}.freeze
  enum role: AUTHORITIES

  authenticates_with_sorcery!
  has_secure_token :auth_token
  validates :email, uniqueness: true, presence: true,
            format: {with: VALID_EMAIL_REGEX}
  validates :password, confirmation: true, presence: true,
            length: {minimum: 6}
  validates :name, presence: true

  has_many :tests
end
