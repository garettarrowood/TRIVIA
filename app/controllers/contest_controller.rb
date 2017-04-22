class ContestController < ApplicationController
  def index
  end

  def team_2016_members
    @members = ::Names::FOR_2016.map do |name|
      TeamMember.find_or_create_by(name: name)
    end
    @year = 2016
    render "team_members"
  end

  def team_2017_members
    @members = ::Names::FOR_2017.map do |name|
      TeamMember.find_or_create_by(name: name)
    end
    @year = 2017
    render "team_members"
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
