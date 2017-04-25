require "standings_scraper"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_standing

  def set_standing
    @standing = Contest.standings
  end
end
