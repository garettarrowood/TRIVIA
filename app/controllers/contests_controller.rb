require "names"
require "gallery_photos"

class ContestsController < ApplicationController

  def index
  end

  def team_members
    set_members(params[:year])
  end

  def team_headquarters
  end

  def team_history
  end

  def team_stats
  end

  def gallery
    set_gallery(params[:year])
  end

private

  def set_members(year)
    @members = ::Names.for(year)
    @year = year
  end

  def set_gallery(year)
    @photos = ::GalleryPhotos.for(year)
    @year = year
  end
end
