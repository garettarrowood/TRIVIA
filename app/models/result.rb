class Result < ApplicationRecord
  scope :descending, -> { order(year: :desc) }

end
