# frozen_string_literal: true

FactoryGirl.define do
  factory :contest do
    year Time.zone.now.year
    number 50
    starts_at Time.zone.local(Time.zone.now.year, 1, 1, 10)
    ends_at Time.zone.local(Time.zone.now.year, 1, 4)
    theme "The Factory of Contests"
  end
end
