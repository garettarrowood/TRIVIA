Rails.application.routes.draw do
  root to: 'contest#index'

  get '/team-2016-members', to: 'contest#team_2016_members'
  get '/team-headquarters', to: "contest#team_headquarters"
  get '/team-history', to: "contest#team_history"
  get '/team-stats', to: "contest#team_stats"
  get '/gallery/:year', to: "contest#gallery"
end
