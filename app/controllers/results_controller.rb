class ResultsController < ApplicationController
  before_action :set_standing

  def index
    @results = Result.all
  end
end
