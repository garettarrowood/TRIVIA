Rails.application.routes.draw do
  root to: 'contests#index'

  get '/team-2016-members', to: "contests#team_2016_members"
  get '/team-2017-members', to: "contests#team_2017_members"
  get '/team-headquarters', to: "contests#team_headquarters"
  get '/team-stats', to: "contests#team_stats"
  get '/gallery/:year', to: "contests#gallery"

  resources :results, only: [:index]
end
