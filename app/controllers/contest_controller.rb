require "names"
require "standings_scraper"

class ContestController < ApplicationController
  before_action :set_standing

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

  private

  def set_standing
    if Time.now < DateTime.new(2017, 4, 24, 1) # eventually compare to db
      result = StandingsScraper.standing
      if result
        @standing = "Currently in #{result}"
      else
        @standing = nil
      end
    end # else report last year's standing
  end
end
