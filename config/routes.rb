Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :comments, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]
  # resources :comments, only: [:create, :destroy]
  resources :goals do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:destroy]
end
