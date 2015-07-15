Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get '/salons', to: 'salons#index'
  get '/salons/edit', to: 'salons#admin'

  get '/downloads', to: 'downloads#index'
  post '/downloads', to: 'downloads#create'

  get '/lang/:lang', to: 'application#set_lang', as: 'set_lang'
  
  get '/admin', to: 'pages#admin'
  scope '/admin' do
    resources :pages, only: [:edit, :update]
    resources :portfolios
    resources :made_in_gs
    resources :showrooms
    resources :news
    resources :salons
    resources :gallery_images
    resources :galleries
    resources :translations
    resources :downloads
  end
end