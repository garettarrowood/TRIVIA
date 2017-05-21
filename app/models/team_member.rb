# frozen_string_literal: true

class TeamMember < ActiveRecord::Base
  has_many :team_member_photos

  def get_pic(year)
    pic = team_member_photos.find_by(year: year)
    pic = assign_pic(year) if pic.nil?
    pic.url
  end

  def assign_pic(year)
    photo_name = name.split(" ").join("")
    team_member_photos.create(year: year, url: "#{year}_bio_pics/#{photo_name}.jpg")
  end
end
