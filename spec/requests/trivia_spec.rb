# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Trivia", type: :request do
  it "renders index template for root" do
    get "/"
    expect(response).to render_template(:index)
  end

  it "renders team_headquarters template" do
    get "/team-headquarters"
    expect(response).to render_template(:team_headquarters)
  end

  it "renders team_stats template" do
    get "/team-stats/2019"
    expect(response).to render_template(:team_stats)
  end

  it "renders gallery template" do
    get "/gallery/2019"
    expect(response).to render_template(:gallery)
  end

  it "renders hours template" do
    create(:contest, year: 2019)
    get "/hours/2019"
    expect(response).to render_template(:hours)
  end

  it "renders index template for results page" do
    get "/results"
    expect(response).to render_template(:index)
  end
end
