class TeamMember < ActiveRecord::Base
  NAMES_2016 = [
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
    "David Cron",
    "King Tut"
  ]

  def assign_pic
    photo_name = name.split(' ').join('')
    self.pic = "2016_bio_pics/#{photo_name}.jpg"
    self
  end
end
