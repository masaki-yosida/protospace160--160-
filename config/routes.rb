Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show]
end
