# frozen_string_literal: true

require "rest-client"
require "nokogiri"

class StandingsScraper
  def initialize
    triva_scores_url = "http://www.90fmtrivia.org/TriviaScores#{current_year}/scorePages/TSK_results.html"
    doc = RestClient.get(triva_scores_url)
    @parsed_doc = Nokogiri::HTML(doc)
  rescue RestClient::NotFound
    @parsed_doc = nil
  end

  def standing
    if in_text.include?("is WHATS")
      in_text.split(" is WHATS")[0]
    else
      tied_text.split(" are ")[0]
    end
  end

  def in_text
    @in_text ||= split_on_in.select { |text| text.include?("WHATSAMATTA-U") }.first
  end

  def tied_text
    @tied_text ||= split_on_tied.select { |text| text.include?("WHATSAMATTA-U") }.first
  end

  def split_on_in
    @parsed_doc.css("dl").children.inner_text.split("\nIn ")
  end

  def split_on_tied
    @parsed_doc.css("dl").children.inner_text.split("\nTied in ")
  end

  def hour
    @parsed_doc.css("h1").text.split("Team Standings as of ")[1]
  end

  def current_results
    return nil unless @parsed_doc
    { standing: standing, hour: hour }
  end

  def result_fields(contest_id)
    {
      team_name: team_name,
      place: place,
      points: points,
      year: current_year,
      contest_id: contest_id
    }
  end

  def team_name
    @team_name ||= begin
      index = tied_text.index("WHATSAMATTA-U")
      tied_text[index..-1].split("\n")[0]
    end
  end

  def numbers
    @numbers ||= standing.split(/[a-zA-Z\s]/).delete_if { |e| e == "" }
  end

  def place
    @place ||= numbers[0].delete(",").to_i
  end

  def points
    @points ||= numbers[1].delete(",").to_i
  end

  def current_year
    @current_year ||= Time.zone.now.year
  end
end
