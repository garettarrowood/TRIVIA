require 'rest-client'
require 'nokogiri'

class StandingsScraper

  def initialize
    triva_2017_scores_url = 'http://www.90fmtrivia.org/TriviaScores2017/scorePages/TSK_results.html'
    doc = RestClient.get(triva_2017_scores_url)
    @parsed_doc = Nokogiri::HTML(doc)

    set_text
  rescue RestClient::NotFound => e
    set_blank_text
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
    @in_text = split_on_in.select{|text| text.include?("WHATSAMATTA-U") }.first
    @tied_text = split_on_tied.select{|text| text.include?("WHATSAMATTA-U") }.first
  end

  def set_blank_text
    @in_text = ""
    @tied_text = ""
  end

  def split_on_in
    @parsed_doc.css("dl").children.inner_text.split("\nIn ")
  end

  def split_on_tied
    @parsed_doc.css("dl").children.inner_text.split("\nTied in ")
  end
end
