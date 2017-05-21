# frozen_string_literal: true

module Names
  # Could load these names directly from assets
  # but then they would be out of order

  FOR_2016 = [
    "Tim McKay",
    "Marianne McKay",
    "Ryan McKay",
    "Adam McKay",
    "JD Grace",
    "Barb Grace",
    "Jeff Mortensen",
    "Rachel Mortensen",
    "Donn Polzin",
    "Luke Berg",
    "Cassie McKay",
    "Evelyn McKay",
    "Dustin Polzin",
    "Garett Arrowood",
    "Josh Chojnaski",
    "Dave Faber",
    "Steven Hessler",
    "Sorana Popa",
    "Greg Davis",
    "Adam Gander",
    "David Trautschold",
    "Austin Konz",
    "David Kron",
    "Mandy Kron",
    "Kathy Short",
    "Teddy Short",
    "Kyle Oksiuta",
    "King Tut"
  ].freeze

  FOR_2017 = [
    "Tim McKay",
    "Marianne McKay",
    "Adam McKay",
    "Derrick Sherer",
    "JD Grace",
    "Barb Grace",
    "Jeff Mortensen",
    "Rachel Mortensen",
    "Donn Polzin",
    "Matt Polzin",
    "Alison Hangen",
    "Dustin Polzin",
    "Luke Berg",
    "Garett Arrowood",
    "Josh Chojnaski",
    "Greg Davis",
    "David Kron",
    "Mandy Kron",
    "Austin Konz",
    "David Trautschold",
    "Steven Hessler",
    "Sorana Hessler"
  ].freeze

  FOR_2018 = [].freeze

  def self.for(year)
    Names.const_get("FOR_#{year}").map do |name|
      TeamMember.find_or_create_by(name: name)
    end
  end
end
