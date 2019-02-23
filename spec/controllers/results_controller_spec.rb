# frozen_string_literal: true

require "rails_helper"

describe ResultsController do
  let!(:result) { create(:result) }

  context "GET #index" do
    it "responds successfully and renders index template" do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end

    it "assigns results & standing" do
      get :index
      expect(assigns(:results).length).to eq 1
      expect(assigns(:results)).to include result
      expect(assigns(:standing)).to be_instance_of String
    end
  end
end
