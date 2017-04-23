class Result < ApplicationRecord
  belongs_to :contest
  scope :descending, -> { order(year: :desc) }
end
