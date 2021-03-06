# frozen_string_literal: true

require "names"
require "gallery_photos"

class ContestsController < ApplicationController
  def index; end

  def team_headquarters; end

  def team_stats
    @year = params[:year]
  end

  def team_members
    assign_members(params[:year])
  end

  def gallery
    assign_gallery(params[:year])
  end

  def hours
    @contest = Contest.find_by(year: params[:contest_id])
  end

private

  def assign_members(year)
    @members = ::Names.for(year)
    @year = year
  end

  def assign_gallery(year)
    @photos = ::GalleryPhotos.for(year)
    @year = year
  end
end
