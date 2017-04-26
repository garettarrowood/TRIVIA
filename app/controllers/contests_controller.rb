require "names"

class ContestsController < ApplicationController

  def index
  end

  def team_2016_members
    set_members(2016)
    render "team_members"
  end

  def team_2017_members
    set_members(2017)
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

  def set_members(year)
    @members = ::Names.for(year)
    @year = year
  end
end
