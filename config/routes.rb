# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "contests#index"

  get "/team-members/:year", to: "contests#team_members"
  get "/team-headquarters", to: "contests#team_headquarters"
  get "/team-stats/:year", to: "contests#team_stats"
  get "/gallery/:year", to: "contests#gallery"
  get "/hours/:contest_id", to: "contests#hours"

  resources :results, only: [:index]
end
