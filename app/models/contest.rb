class Contest < ApplicationRecord
  has_one :result

  scope :last_completed, -> {
    where("DATE(ends_at) <= ?", Date.current).order(ends_at: :desc).first
  }

  def self.is_going_on_now?
    current = find_by(year: Time.now.year)
    Time.now.between?(current.starts_at, current.ends_at + 5.hours)
  end

end
