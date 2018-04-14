# frozen_string_literal: true

require "rest-client"
require "nokogiri"

class QuestionPointsScraper
  def initialize
    points_url =
      "http://www.90fmtrivia.org/TriviaScores" \
      "#{current_year}/scorePages/TSK_points.html"
    doc = RestClient.get(points_url)
    @parsed_doc = Nokogiri::HTML(doc)
  rescue RestClient::NotFound
    @parsed_doc = nil
  end

  def hour_and_points
    @hour_and_points ||= begin
      array_of_text = @parsed_doc.css("table").children.inner_text.split("\r\n")
      points_by_question = array_of_text.select do |string|
        string.include?("Hour")
      end
      points_by_question.map do |points|
        sanitized_points = points.gsub("    Hour ", "").gsub("  ", "")
        sanitized_points.scan(/\d+|[A-Za-z\s]+/).reject do |string|
          string == " "
        end
      end
    end
  end

  def current_year
    @current_year ||= Time.zone.now.year
  end
end
