require 'rest-client'
require 'nokogiri'

class StandingsScraper

  def initialize
    triva_2017_scores_url = 'http://www.90fmtrivia.org/TriviaScores2017/scorePages/TSK_results.html'
    doc = RestClient.get(triva_2017_scores_url)
    @parsed_doc = Nokogiri::HTML(doc)
  rescue RestClient::NotFound => e
    @parsed_doc = nil
  end

  def standing
    if @in_text.include?("is WHATS")
      @in_text.split(" is WHATS")[0]
    else
      @tied_text.split(" are ")[0]
    end
  end

  def set_text
    @in_text = split_on_in.select{|text| text.include?("WHATSAMATTA-U") }.first
    @tied_text = split_on_tied.select{|text| text.include?("WHATSAMATTA-U") }.first
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
    if @parsed_doc
      set_text
      { standing: standing, hour: hour }
    else
      nil
    end
  end

  def result_fields
    set_text
    index = @tied_text.index("WHATSAMATTA-U")
    team_name = @tied_text[index..-1].split("\r")[0]
    numbers = standing.split(/[a-zA-Z\s]/).delete_if{|e| e == ""}
    place = numbers[0].gsub(",", "").to_i
    points = numbers[1].gsub(",", "").to_i
    year = Time.now.year

    {
      team_name: team_name,
      place: place,
      points: points,
      year: year
    }
  end
end
