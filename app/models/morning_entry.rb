class MorningEntry < ApplicationRecord
  belongs_to :user
  validates :bedtime, presence: true
  validates :wake_up_time, presence: true
  validates :ease_of_sleep, inclusion: 0..3, presence: true
  validates :hours_of_sleep, presence: true
  validates :morning_entry, presence: true
end