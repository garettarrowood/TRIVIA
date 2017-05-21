# frozen_string_literal: true

FactoryGirl.define do
  factory :contest do
    year 2017
    number 48
    starts_at Time.zone.local(2017, 4, 21, 18)
    ends_at Time.zone.local(2017, 4, 24)
    theme "The Royalty of Contests"
  end
end
