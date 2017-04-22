require 'rest-client'
require 'nokogiri'

class StandingsScraper

  def initialize
    triva_scores_url = 'http://www.90fmtrivia.org/TriviaScores2017/scorePages/TSK_results.html'
    doc = RestClient.get(triva_scores_url)
    @parsed_doc = Nokogiri::HTML(doc)

    set_text
  rescue RestClient::NotFound => e
    @in_text = ""
    @tied_text = ""
  end

  def self.standing
    new.standing
  end

  def standing
    if @in_text.include?("is WHATS")
      @in_text.split(" is WHATS")[0]
    else
      @tied_text.split(" are ")[0]
    end
  end

  def set_text
    in_split = @parsed_doc.css("dl").children.inner_text.split("\nIn ")
    tied_split = @parsed_doc.css("dl").children.inner_text.split("\nTied in ")

    @in_text = in_split.select{|text| text.include?("WHATSAMATTA-U") }.first
    @tied_text = tied_split.select{|text| text.include?("WHATSAMATTA-U") }.first
  end
end
