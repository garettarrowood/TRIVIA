# frozen_string_literal: true

class Hour < ApplicationRecord
  belongs_to :contest

  validates :number, numericality:
    { greater_than_or_equal_to: 1, less_than_or_equal_to: 54 }
  validates :contest, :points, presence: true
  validates :points, :place, numericality: { greater_than_or_equal_to: 0 }

  class << self
    def update_contest(contest, hour_word, standing)
      number = get_number(hour_word)
      return if contest.hours.find_by(number: number)
      place = standing.split(" ")[0].to_i
      points = standing.split("with ")[1].delete(",").to_i
      create(contest: contest, number: number, place: place, points: points)
    end

  private

    def get_number(hour_word)
      word_num = hour_word.split("Hour ")[1]
      HOURS[word_num.downcase.to_sym]
    end

    HOURS = {
      "one": 1,
      "two": 2,
      "three": 3,
      "four": 4,
      "five": 5,
      "six": 6,
      "seven": 7,
      "eight": 8,
      "nine": 9,
      "ten": 10,
      "eleven": 11,
      "twelve": 12,
      "thirteen": 13,
      "fourteen": 14,
      "fifteen": 15,
      "sixteen": 16,
      "seventeen": 17,
      "eighteen": 18,
      "nineteen": 19,
      "twenty": 20,
      "twenty one": 21,
      "twenty two": 22,
      "twenty three": 23,
      "twenty four": 24,
      "twenty five": 25,
      "twenty six": 26,
      "twenty seven": 27,
      "twenty eight": 28,
      "twenty nine": 29,
      "thirty": 30,
      "thirty one": 31,
      "thirty two": 32,
      "thirty three": 33,
      "thirty four": 34,
      "thirty five": 35,
      "thirty six": 36,
      "thirty seven": 37,
      "thirty eight": 38,
      "thirty nine": 39,
      "forty": 40,
      "forty one": 41,
      "forty two": 42,
      "forty three": 43,
      "forty four": 44,
      "forty five": 45,
      "forty six": 46,
      "forty seven": 47,
      "forty eight": 48,
      "forty nine": 49,
      "fifty": 50,
      "fifty one": 51,
      "fifty two": 52,
      "fifty three": 53,
      "fifty four": 54
    }.freeze
  end
end