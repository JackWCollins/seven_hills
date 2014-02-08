SevenHills::Application.routes.draw do
  root 'pages#home'

  get '/home', to: 'pages#home'
  get '/tandem', to: 'pages#tandem'
  get '/iad', to: 'pages#iad'
  get '/experienced', to: 'pages#experienced'
  get '/pricing', to: 'pages#pricing'
  get '/faq', to: 'pages#faq'
  get '/testimonials', to: 'pages#testimonials'
  get '/facilities', to: 'pages#facilities'
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/members', to: 'users#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/continuing', to: 'pages#continuing'
  get '/set_member', to: 'users#set_member'
  post '/set_member', to: 'users#member_authentication'
  patch '/set_member', to: 'users#member_authentication'

  resources :posts, only: [:new, :create, :edit, :update]
  resources :users, only: [:create, :edit, :show]
  resources :shifts
  resources :groups, only: [:new, :create]
  resources :reservations, only: [:new, :create, :index]
end
