class User < ApplicationRecord
  has_many :bills

  enum role: [ :admin, :customer ]
  validates :username, presence: true, length: {maximum: Settings.maxName}
  validates :password, presence: true, length: {minimum: Settings.minPass}, allow_nil: true
  validates :email, format: {with: Settings.VALID_EMAIL_REGEX},
    presence: true, length: {maximum: Settings.maxMail},
    uniqueness: {case_sensitive: false}
end
