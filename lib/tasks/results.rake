namespace :results do
  desc 'Create results - only once'
  task :populate_db => :environment do
    past_results = [
      { year: 1993,
        place: 264,
        team_name: "Got Me By the Tail",
        points: 995
      },
      { year: 1994,
        place: 118,
        team_name: "Whatsamatta-U",
        points: 2845
      },
      { year: 1995,
        place: 99,
        team_name: "Whatsamatta-U - Your M&M is Blue!?",
        points: 2995
      },
      { year: 1996,
        place: 52,
        team_name: "Whatsamatta-U - Dr. Ben Casey Code Blue",
        points: 4120
      },
      { year: 1997,
        place: 48,
        team_name: "Whatsamatta-U - Got Those Oreo Blues?",
        points: 4490
      },
      { year: 1998,
        place: 32,
        team_name: "Whatsamatta-U - Harry, This Cubs for You",
        points: 5485
      },
      { year: 1999,
        place: 29,
        team_name: "Whatsamatta-U - Heads We Win, Tails You Lose!",
        points: 5470
      },
      { year: 2000,
        place: 18,
        team_name: "Whatsamatta-U - Catch-22",
        points: 6645
      },
      { year: 2001,
        place: 21,
        team_name: "Whatsamatta-U - I Beg Your Pardon, Too",
        points: 5665
      },
      { year: 2002,
        place: 29,
        team_name: "Whatsamatta-U - My Guitar Weeps For U",
        points: 5060
      },
      { year: 2003,
        place: 34,
        team_name: "Whatsamatta-U - Who Are Two",
        points: 6165
      },
      { year: 2004,
        place: 14,
        team_name: "Whatsamatta-U - Audrey's Marsh Madness",
        points: 6400
      },
      { year: 2005,
        place: 29,
        team_name: "Whatsamatta-U - A Triviashamockery",
        points: 5735
      },
      { year: 2006,
        place: 22,
        team_name: "Whatsamatta-U - Chitty-Cheney BANG BANG",
        points: 5210
      },
      { year: 2007,
        place: 21,
        team_name: "Whatsamatta-U - Knight's of Triviality",
        points: 6355
      },
      { year: 2008,
        place: 24,
        team_name: "Whatsamatta-U - Client Number 9...#9...#9...#9...#9",
        points: 5680
      },
      { year: 2009,
        place: 24,
        team_name: "Whatsamatta-U - Kellogg's Frosted Phelps",
        points: 5800
      },
      { year: 2010,
        place: 21,
        team_name: "Whatsamatta-U - Toyota Gimme-A-Brake?",
        points: 5820
      },
      { year: 2011,
        place: 8,
        team_name: "Whatsamatta-U - 35% Beef 65% Meat Dress",
        points: 7610
      },
      { year: 2012,
        place: 4,
        team_name: "Whatsamatta-U - Death By Misadventure",
        points: 8080
      },
      { year: 2013,
        place: 17,
        team_name: "Whatsamatta-U - @20",
        points: 6655
      },
      { year: 2014,
        place: 19,
        team_name: "Whatsamatta-U - Beyond the Nakedness",
        points: 13990
      },
      { year: 2015,
        place: 21,
        team_name: "Whatsamatta-U - Live Long and Prosper",
        points: 15460
      },
      { year: 2016,
        place: 30,
        team_name: "Whatsamatta-U - Major Tom's Fish Frey",
        points: 10500
      }
    ]

    Result.create(past_results)
  end
end
