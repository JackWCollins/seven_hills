SevenHills::Application.routes.draw do
  root 'pages#home'

  get '/home', to: 'pages#home'
  get '/tandem', to: 'pages#tandem'
  get '/iad', to: 'pages#iad'
  get '/experienced', to: 'pages#experienced'
  get '/facilities', to: 'pages#facilities'
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/members', to: 'users#index'

  resources :posts
  resources :users, only: [:show, :create, :edit, :update]

end
