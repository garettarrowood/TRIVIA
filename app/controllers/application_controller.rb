require "standings_scraper"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_standing

  def set_standing
    year = Time.now.year

    if Contest.is_going_on_now?
      results = StandingsScraper.new(year).current_results
      @standing = results.present? ? "As of #{results[:hour]}: #{results[:standing]}" : nil
    else
      last_contest = Contest.last_completed
      ranking = last_contest.result&.place

      if !ranking.present?
        result = Result.create(StandingsScraper.new(year).result_fields.merge(contest_id: last_contest.id))
        ranking = result.place
      end

      @standing = "Placed #{ranking.ordinalize} in Triva #{last_contest.number} - #{last_contest.theme}"
    end
  end
end
