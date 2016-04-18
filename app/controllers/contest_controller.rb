class ContestController < ApplicationController
  def index
  end

  def team_members
    @members = TeamMember::NAMES_2016.map do |name|
      TeamMember.find_or_create_by(name: name).assign_pic
    end
  end

  def team_headquarters
  end

  def team_history
  end

  def team_stats
  end

  def gallery
    @photos = Dir['app/assets/images/'+params[:year]+'/*'].map do |file_name|
      params[:year]+"/"+file_name.split('/')[-1]
    end
  end
end
