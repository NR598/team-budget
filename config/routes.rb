Rails.application.routes.draw do
  root 'sessions#new'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :transactions do
    resources :notes, only: [:show, :create]
  end
end