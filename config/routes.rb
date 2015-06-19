Rails.application.routes.draw do
  root 'pages#index'

  resources :pages
  resources :portfolios
end
