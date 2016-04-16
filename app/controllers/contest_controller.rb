class ContestController < ApplicationController
  def index
  end

  def team_members
    @members = TeamMember::NAMES.map do |name|
      TeamMember.find_or_create_by(name: name)
    end
  end

  def team_headquarters
  end

  def team_history
  end

  def gallery
    @photos = Dir['app/assets/images/2016/*'].map do |file_name|
      "2016/"+file_name.split('/')[-1]
    end
  end
end
