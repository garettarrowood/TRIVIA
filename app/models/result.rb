# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :contest
  scope :descending, -> { order(year: :desc) }
end
