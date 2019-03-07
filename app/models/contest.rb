# frozen_string_literal: true

class Contest < ApplicationRecord
  has_one :result
  has_many :hours

  class << self
    attr_writer :last_completed

    def standings
      if going_on_now?
        results = current_results
        Hour.update_contest(current_contest, results[:hour], results[:standing])
        result_banner(results)
      else
        Contest.any? ? last_completed_banner : ""
      end
    end

  private

    def result_banner(results)
      results.present? ? "As of #{results[:hour]}: #{results[:standing]}" : nil
    end

    def last_completed_banner
      ranking = last_completed.result&.place
      ranking = Result.create(result_fields).place if ranking.blank?
      "Placed #{ranking.ordinalize} in Triva " \
      "#{last_completed.number} - #{last_completed.theme}"
    end

    def going_on_now?
      Time.zone.now.between?(
        current_contest.starts_at,
        current_contest.ends_at + 5.hours
      )
    end

    def last_completed
      @last_completed =
        where("DATE(ends_at) <= ?", Date.current).order(ends_at: :desc).first
    end

    def result_fields
      StandingsScraper.new.result_fields(last_completed.id)
    end

    def current_results
      StandingsScraper.new.current_results
    end

    def current_contest
      @current_contest ||= begin
        contest = Contest.find_by(year: Time.zone.now.year)
        contest = Contest.find_by(year: Time.zone.now.year - 1) if contest.nil?
        contest
      end
    end
  end
end
