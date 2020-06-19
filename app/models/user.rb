class User < ApplicationRecord
  has_many :morning_entries
  has_many :evening_entries
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  has_secure_password
end