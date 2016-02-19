Rails.application.routes.draw do
  root to: 'pages#home'

  get '/', to: 'pages#home', as: 'home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'

  get '/users', to: 'users#index', as: 'users'
  get '/orgs/:organization_id', to: 'users#new_tech', as: 'tech_signup'
  post '/users', to: 'users#create_tech'

  get '/orgs', to: 'organizations#index', as: 'organizations'
end
