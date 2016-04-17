class TeamMember < ActiveRecord::Base
  NAMES = [
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
    "Kyle Oksiuta",
    "Austin Konz",
    "King Tut"
  ]
end

class String
  def to_snakecase
    self.split(' ').map(&:downcase).join("_")
  end
end