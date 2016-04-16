Rails.application.routes.draw do
  root to: 'contest#index'

  get '/team-members', to: 'contest#team_members'
  get '/team-headquarters', to: "contest#team_headquarters"
  get '/team-history', to: "contest#team_history"
  
end
