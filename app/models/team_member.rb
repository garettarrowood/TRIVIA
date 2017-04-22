class TeamMember < ActiveRecord::Base
  has_many :team_member_photos

  def get_pic(year)
    pic = self.team_member_photos.find_by(year: year)
    pic = self.assign_pic(year) if pic.nil?
    pic.url
  end

private

  def assign_pic(year)
    photo_name = name.split(' ').join('')
    self.team_member_photos.create(year: year, url: "#{year}_bio_pics/#{photo_name}.jpg")
  end
end
