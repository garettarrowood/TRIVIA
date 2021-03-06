# frozen_string_literal: true

namespace :results do
  desc "Create results - only once"
  task populate_db: :environment do
    past_results = [
      { year: 1993,
        place: 264,
        team_name: "Got Me By the Tail",
        points: 995 },
      { year: 1994,
        place: 118,
        team_name: "Whatsamatta-U",
        points: 2845 },
      { year: 1995,
        place: 99,
        team_name: "Whatsamatta-U - Your M&M is Blue!?",
        points: 2995 },
      { year: 1996,
        place: 52,
        team_name: "Whatsamatta-U - Dr. Ben Casey Code Blue",
        points: 4120 },
      { year: 1997,
        place: 48,
        team_name: "Whatsamatta-U - Got Those Oreo Blues?",
        points: 4490 },
      { year: 1998,
        place: 32,
        team_name: "Whatsamatta-U - Harry, This Cubs for You",
        points: 5485 },
      { year: 1999,
        place: 29,
        team_name: "Whatsamatta-U - Heads We Win, Tails You Lose!",
        points: 5470 },
      { year: 2000,
        place: 18,
        team_name: "Whatsamatta-U - Catch-22",
        points: 6645 },
      { year: 2001,
        place: 21,
        team_name: "Whatsamatta-U - I Beg Your Pardon, Too",
        points: 5665 },
      { year: 2002,
        place: 29,
        team_name: "Whatsamatta-U - My Guitar Weeps For U",
        points: 5060 },
      { year: 2003,
        place: 34,
        team_name: "Whatsamatta-U - Who Are Two",
        points: 6165 },
      { year: 2004,
        place: 14,
        team_name: "Whatsamatta-U - Audrey's Marsh Madness",
        points: 6400 },
      { year: 2005,
        place: 29,
        team_name: "Whatsamatta-U - A Triviashamockery",
        points: 5735 },
      { year: 2006,
        place: 22,
        team_name: "Whatsamatta-U - Chitty-Cheney BANG BANG",
        points: 5210 },
      { year: 2007,
        place: 21,
        team_name: "Whatsamatta-U - Knight's of Triviality",
        points: 6355 },
      { year: 2008,
        place: 24,
        team_name: "Whatsamatta-U - Client Number 9...#9...#9...#9...#9",
        points: 5680 },
      { year: 2009,
        place: 24,
        team_name: "Whatsamatta-U - Kellogg's Frosted Phelps",
        points: 5800 },
      { year: 2010,
        place: 21,
        team_name: "Whatsamatta-U - Toyota Gimme-A-Brake?",
        points: 5820 },
      { year: 2011,
        place: 8,
        team_name: "Whatsamatta-U - 35% Beef 65% Meat Dress",
        points: 7610 },
      { year: 2012,
        place: 4,
        team_name: "Whatsamatta-U - Death By Misadventure",
        points: 8080 },
      { year: 2013,
        place: 17,
        team_name: "Whatsamatta-U - @20",
        points: 6655 },
      { year: 2014,
        place: 19,
        team_name: "Whatsamatta-U - Beyond the Nakedness",
        points: 13_990 },
      { year: 2015,
        place: 21,
        team_name: "Whatsamatta-U - Live Long and Prosper",
        points: 15_460 },
      { year: 2016,
        place: 30,
        team_name: "Whatsamatta-U - Major Tom's Fish Frey",
        points: 10_500 }
    ]

    Result.create(past_results)
  end

  desc "Create and assoc Contests"
  task contests: :environment do
    Time.zone = "Central Time (US & Canada)"

    past_contests = [
      { year: 1993,
        number: 24,
        starts_at: Time.zone.local(1993, 4, 16, 18),
        ends_at: Time.zone.local(1993, 4, 19, 0),
        theme: "Trivia's in Point" },
      { year: 1994,
        number: 25,
        starts_at: Time.zone.local(1994, 4, 15, 18),
        ends_at: Time.zone.local(1994, 4, 20, 0),
        theme: "Trivia Park" },
      { year: 1995,
        number: 26,
        starts_at: Time.zone.local(1995, 4, 7, 18),
        ends_at: Time.zone.local(1995, 4, 10, 0),
        theme: "The Six Million Dollar Contest" },
      { year: 1996,
        number: 27,
        starts_at: Time.zone.local(1996, 4, 12, 18),
        ends_at: Time.zone.local(1996, 4, 15, 0),
        theme: "What a Long Strange Trip It's Been" },
      { year: 1997,
        number: 28,
        starts_at: Time.zone.local(1997, 4, 11, 18),
        ends_at: Time.zone.local(1997, 4, 14, 0),
        theme: "Mission: Trivia" },
      { year: 1998,
        number: 29,
        starts_at: Time.zone.local(1998, 4, 17, 18),
        ends_at: Time.zone.local(1998, 4, 20, 0),
        theme: "On The Road" },
      { year: 1999,
        number: 30,
        starts_at: Time.zone.local(1999, 4, 16, 18),
        ends_at: Time.zone.local(1999, 4, 19, 0),
        theme: "Trivia Like It's 1999" },
      { year: 2000,
        number: 31,
        starts_at: Time.zone.local(2000, 4, 14, 18),
        ends_at: Time.zone.local(2000, 4, 17, 0),
        theme: "The Bug Strikes" },
      { year: 2001,
        number: 32,
        starts_at: Time.zone.local(2001, 4, 20, 18),
        ends_at: Time.zone.local(2001, 4, 23, 0),
        theme: "Old Days" },
      { year: 2002,
        number: 33,
        starts_at: Time.zone.local(2002, 4, 19, 18),
        ends_at: Time.zone.local(2002, 4, 22, 0),
        theme: "All In The Contest" },
      { year: 2003,
        number: 34,
        starts_at: Time.zone.local(2003, 4, 11, 18),
        ends_at: Time.zone.local(2003, 4, 14, 0),
        theme: "Survivor" },
      { year: 2004,
        number: 35,
        starts_at: Time.zone.local(2004, 4, 16, 18),
        ends_at: Time.zone.local(2004, 4, 19, 0),
        theme: "Thanks For The Contest" },
      { year: 2005,
        number: 36,
        starts_at: Time.zone.local(2005, 4, 8, 18),
        ends_at: Time.zone.local(2005, 4, 11, 0),
        theme: "Keep On Trivia" },
      { year: 2006,
        number: 37,
        starts_at: Time.zone.local(2006, 4, 7, 18),
        ends_at: Time.zone.local(2006, 4, 10, 0),
        theme: "The Odd Contest" },
      { year: 2007,
        number: 38,
        starts_at: Time.zone.local(2007, 4, 20, 18),
        ends_at: Time.zone.local(2007, 4, 23, 0),
        theme: "Trivia Returns" },
      { year: 2008,
        number: 39,
        starts_at: Time.zone.local(2008, 4, 11, 18),
        ends_at: Time.zone.local(2008, 4, 14, 0),
        theme: "The Trivia Invasion" },
      { year: 2009,
        number: 40,
        starts_at: Time.zone.local(2009, 4, 17, 18),
        ends_at: Time.zone.local(2009, 4, 20, 0),
        theme: "Here's Looking At You Kid" },
      { year: 2010,
        number: 41,
        starts_at: Time.zone.local(2010, 4, 16, 18),
        ends_at: Time.zone.local(2010, 4, 19, 0),
        theme: "The Dark Side of The Contest" },
      { year: 2011,
        number: 42,
        starts_at: Time.zone.local(2011, 4, 8, 18),
        ends_at: Time.zone.local(2011, 4, 11, 0),
        theme: "Vitailovetriviamin" },
      { year: 2012,
        number: 43,
        starts_at: Time.zone.local(2012, 4, 20, 18),
        ends_at: Time.zone.local(2012, 4, 23, 0),
        theme: "Trivia Grit" },
      { year: 2013,
        number: 44,
        starts_at: Time.zone.local(2013, 4, 19, 18),
        ends_at: Time.zone.local(2013, 4, 22),
        theme: "That's Not All Folks" },
      { year: 2014,
        number: 45,
        starts_at: Time.zone.local(2014, 4, 11, 18),
        ends_at: Time.zone.local(2014, 4, 14),
        theme: "Trivia On 45" },
      { year: 2015,
        number: 46,
        starts_at: Time.zone.local(2015, 4, 17, 18),
        ends_at: Time.zone.local(2015, 4, 20),
        theme: "Guardians of the Contest" },
      { year: 2016,
        number: 47,
        starts_at: Time.zone.local(2016, 4, 15, 18),
        ends_at: Time.zone.local(2016, 4, 18),
        theme: "It's Not Your Father's Contest" },
      { year: 2017,
        number: 48,
        starts_at: Time.zone.local(2017, 4, 21, 18),
        ends_at: Time.zone.local(2017, 4, 24),
        theme: "The Royalty of Contests" }
    ]

    Contest.create(past_contests)
  end

  desc "Create 2018 Contest"
  task contest_2018: :environment do
    Time.zone = "Central Time (US & Canada)"
    contest2018 =
      { year: 2018,
        number: 49,
        starts_at: Time.zone.local(2018, 4, 13, 18),
        ends_at: Time.zone.local(2018, 4, 16),
        theme: "Trivia Rush of 49" }

    Contest.create(contest2018)
  end

  desc "Create 2019 Contest"
  task contest_2019: :environment do
    Time.zone = "Central Time (US & Canada)"
    contest2019 =
      { year: 2019,
        number: 50,
        starts_at: Time.zone.local(2019, 4, 12, 18),
        ends_at: Time.zone.local(2019, 4, 15),
        theme: "Trivia 5-0" }

    Contest.create(contest2019)
  end

  desc "Attach results to Contests"
  task affiliate_contests: :environment do
    Result.all.each do |result|
      contest = Contest.find_by(year: result.year)
      result.contest = contest
      result.save!
    end
  end
end
