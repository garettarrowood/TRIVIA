require "standings_scraper"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_standing

  def set_standing
    if Contest.is_going_on_now?
      results = StandingsScraper.new.current_results
      if results
        @standing = "As of #{results[:hour]}: #{results[:standing]}"
      else
        @standing = nil
      end
    end # else report last year's standing
  end
end
