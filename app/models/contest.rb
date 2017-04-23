class Contest < ApplicationRecord
  has_one :result

  scope :is_going_on_now?, -> {
    current = find_by(year: Time.now.year)
    Time.now.between?(current.starts_at, current.ends_at + 1.hours)
  }

end
