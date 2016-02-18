Rails.application.routes.draw do
  root to: "/"

  get '/', to: 'pages#index', as: 'index'
end
