require "standings_scraper"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_standing

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
