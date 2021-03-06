Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/about', to: 'pages#about', as: 'about'

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/sessions', to: 'sessions#create'

  get '/users', to: 'users#index', as: 'users'
  get '/orgs/:organization_id', to: 'users#new_tech', as: 'tech_signup'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show', as: 'profile'
  #   'donors/new'
  get '/donations/new/new_donor', to: 'users#new_donor', as: 'donor_signup'
  #   'donors/:id/donations/verify_donor'
  get '/donations/new/:id', to: 'users#edit_donor', as: 'edit_donor'
  #     '/donors/:id'
  patch '/users/:id', to: 'users#update_donor'

  get '/orgs', to: 'organizations#index', as: 'organizations'
  #   '/orgs/:org_id/dashboard' - donations dashboard for orgs
  get '/profile/dashboards/organization', to: 'organizations#org_dashboard', as: 'organization'
  #   '/techs/:tech_id/sticks'
  get '/profile/dashboards/my_sticks', to: 'organizations#my_sticks_dashboard', as: 'sticks_dashboard'

  #   '/donors/:id/donations/vitals'
  get '/donations/new/:donor_id/vitals', to: 'donations#new', as: "new_donation"
  post '/donations', to: 'donations#create'
end
