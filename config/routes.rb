Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  root to: "restaurants#index"
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]

  resources :users, only: [:show]
end
