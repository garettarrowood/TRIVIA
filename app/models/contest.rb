class Contest < ApplicationRecord
  has_one :result

  class << self
    def last_completed
      @last_completed ||= where("DATE(ends_at) <= ?", Date.current).order(ends_at: :desc).first
    end

    def going_on_now?
      current = find_by(year: Time.now.year)
      Time.now.between?(current.starts_at, current.ends_at + 5.hours)
    end

    def standings
      if going_on_now?
        results = current_results
        results.present? ? "As of #{results[:hour]}: #{results[:standing]}" : nil
      else
        ranking = last_completed.result&.place
        ranking = Result.create(result_fields).place if ranking.blank?
        "Placed #{ranking.ordinalize} in Triva #{last_completed.number} - #{last_completed.theme}"
      end
    end

    def result_fields
      StandingsScraper.new.result_fields(last_completed.id)
    end

    def current_results
      StandingsScraper.new.current_results
    end
  end

end
