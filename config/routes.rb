Rails.application.routes.draw do
  root 'sessions#new'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # post 'auth/google_oauth2/callback', to: 'sessions#googleAuth'
  # post 'auth/failure', to: redirect('/')
  get '/transactions/index', to: 'transactions#index'

  get '/auth/google_oauth2/callback', to: 'sessions#google_auth'
  get 'auth/failure/', to: redirect('/')
  resources :users
  resources :transactions do
    resources :notes, only: [:show, :create]
  end
end