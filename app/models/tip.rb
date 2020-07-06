class Tip < ApplicationRecord
  has_many :usertips
  has_many :users, through: :usertips
end
