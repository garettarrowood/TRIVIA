# frozen_string_literal: true

require "rails_helper"

describe ContestsController do
  let(:contest) { create(:contest) }
  let!(:result) { create(:result, contest: contest) }

  context "GET #index" do
    it "responds successfully and renders index template" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  context "GET #team_headquarters" do
    it "responds successfully and renders team_headquarters template" do
      get :team_headquarters
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("team_headquarters")
    end
  end

  context "GET #team_stats" do
    it "responds successfully and renders team_stats template" do
      get :team_stats
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("team_stats")
    end
  end
end
