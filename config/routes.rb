Rails.application.routes.draw do
  root to: 'sessions#new'

  # get '/', to: 'pages#home', as: 'home'

  get '/', to: 'sessions#new', as: 'new_session'

  get '/users', to: 'users#index', as: 'users'
  get '/orgs/:organization_id', to: 'users#new_tech', as: 'tech_signup'
  post '/users', to: 'users#create_tech'

  get '/orgs', to: 'organizations#index', as: 'organizations'
end
