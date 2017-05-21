# frozen_string_literal: true

require "rails_helper"

describe ContestsController do
  let(:current_year) { Time.zone.now.year }
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

  context "GET #team_members" do
    let(:params) do
      {
        year: current_year
      }
    end

    before do
      get :team_members, params: params
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
end
