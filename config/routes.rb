Rails.application.routes.draw do
  root to: 'pages#home'

  get '/', to: 'pages#home', as: 'home'

  get '/users', to: 'users#index', as: 'users'
  get '/orgs/:organization_id', to: 'users#new_tech', as: 'tech_signup'

  get '/orgs', to: 'organizations#index', as: 'organizations'
end
