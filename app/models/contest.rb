# frozen_string_literal: true

class Contest < ApplicationRecord
  has_one :result

  class << self
    def standings
      going_on_now? ? current_result_banner : last_completed_banner
    end

  private

    def current_result_banner
      results = current_results
      results.present? ? "As of #{results[:hour]}: #{results[:standing]}" : nil
    end

    def last_completed_banner
      ranking = last_completed.result&.place
      ranking = Result.create(result_fields).place if ranking.blank?
      "Placed #{ranking.ordinalize} in Triva #{last_completed.number} - #{last_completed.theme}"
    end

    def going_on_now?
      current = find_by(year: Time.zone.now.year)
      Time.zone.now.between?(current.starts_at, current.ends_at + 5.hours)
    end

    def last_completed
      @last_completed ||= where("DATE(ends_at) <= ?", Date.current).order(ends_at: :desc).first
    end

    def result_fields
      StandingsScraper.new.result_fields(last_completed.id)
    end

    def current_results
      StandingsScraper.new.current_results
    end
  end
end
