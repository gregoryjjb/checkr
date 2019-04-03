Rails.application.routes.draw do

  get 'training_files/index'
  get 'training_files/new'
  # Home page
  root 'application#index'

  # Sign up
  get '/signup', to: 'users#new'

  # Log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # Log out
  delete '/logout', to: 'sessions#destroy'

  # About
  get '/about', to: 'application#about'

  # Check files
  get '/check', to: 'testing_files#new'
  post '/check', to: 'testing_files#create'

  resources :users

  resources :training_files

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
