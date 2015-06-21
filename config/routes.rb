Rails.application.routes.draw do
  root 'pages#index'
  get '/salons', to: 'salons#index'

  resources :pages
  resources :portfolios
  resources :showrooms
  resources :news
  resources :salons
  resources :gallery_images
  resources :galleries
end