Rails.application.routes.draw do
  root to: 'pages#home'

  get '/', to: 'pages#home', as: 'home'

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/sessions', to: 'sessions#create'

  get '/users', to: 'users#index', as: 'users'
  get '/orgs/:organization_id', to: 'users#new_tech', as: 'tech_signup'
  post '/users', to: 'users#create_tech'
  get '/profile', to: 'users#show', as: 'profile'
  get '/donations/new/new_donor', to: 'users#new_donor', as: 'donor_signup'
  get '/donations/new/:id', to: 'users#update_donor', as: 'update_donor'

  get '/orgs', to: 'organizations#index', as: 'organizations'

  # get '/donations/new/:donor_id', to: 'donations#new', as: "new_donation"
end
