# frozen_string_literal: true

require "rails_helper"

describe ContestsController do
  let(:contest) { create(:contest) }
  let!(:result) { create(:result, contest: contest) }

  let(:current_year) { Time.zone.now.year }
  let(:current_year_params) do
    {
      year: current_year
    }
  end

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

  context "GET #team_members" do
    before do
      get :team_members, params: current_year_params
    end

    it "responds successfully and renders team_members template" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("team_members")
    end

    it "assigns members and year" do
      expect(assigns(:year)).to eq current_year.to_s
      expect(assigns(:members)).to_not be_nil
    end
  end

  context "GET #gallery" do
    before do
      get :gallery, params: current_year_params
    end

    it "responds successfully and renders gallery template" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("gallery")
    end

    it "assigns members and year" do
      expect(assigns(:year)).to eq current_year.to_s
      expect(assigns(:photos)).to_not be_nil
    end
  end
end
