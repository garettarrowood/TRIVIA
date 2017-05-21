require 'rails_helper'

describe ResultsController do
  let!(:result) { create(:result) }

  context "GET #index" do
    it "responds successfully and renders index template" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end

    it "assigns results" do
      get :index
      expect(assigns(:results).length).to eq 1
      expect(assigns(:results)).to include result
    end
  end
end
