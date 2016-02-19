Rails.application.routes.draw do
  root to: 'pages#home'

  get '/', to: 'pages#home', as: 'home'

  get '/users', to: 'users#index', as: 'users'
  get '/signup', to: 'users#new', as: 'tech_signup'
end
