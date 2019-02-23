# frozen_string_literal: true

FactoryBot.define do
  factory :result do
    year { Time.zone.now.year }
    place { 30 }
    points { 10_000 }
    team_name { "Whatsamatta" }
    contest
  end
end
