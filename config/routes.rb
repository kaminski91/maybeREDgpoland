Rails.application.routes.draw do
  resources :news_images
  devise_for :users, :controllers => { :registrations => :registrations }
  root 'pages#index'

  get '/salons', to: 'salons#index'
  post '/salons', to: 'salons#create'
  get '/salons/edit', to: 'salons#admin', as: 'admin_salons'

  get '/downloads', to: 'downloads#index'
  post '/downloads', to: 'downloads#create'

  get '/lang/:lang', to: 'application#set_lang', as: 'set_lang'
  
  get '/admin', to: 'pages#admin'
  scope '/admin' do
    resources :pages, only: [:edit, :update]
    resources :portfolios
    get '/portfolios/down/:np', to: 'portfolios#down', as: "portfolios_down" 
    get '/portfolios/up/:np', to: 'portfolios#up', as: "portfolios_up" 
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