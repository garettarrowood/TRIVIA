class ResultsController < ApplicationController
  def index
    @results = Result.all
  end
end
