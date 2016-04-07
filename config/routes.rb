Rails.application.routes.draw do

  root to: "application#redirect_from_root"

  resources :users, only: [:new, :create, :show] do
    resources :comments, only: [:create]
  end

  #make login url pretty
  resource :session, only: [ :create, :destroy], path: 'login'
  get '/login/', to: 'sessions#new', as: 'login'

  resources :goals do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:destroy]


end
