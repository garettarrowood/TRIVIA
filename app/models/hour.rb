# frozen_string_literal: true

class Hour < ApplicationRecord
  belongs_to :contest

  validates :number, numericality:
    { greater_than_or_equal_to: 1, less_than_or_equal_to: 54 }
  validates :contest, :points, presence: true
  validates :points, numericality: { greater_than_or_equal_to: 0 }
end
