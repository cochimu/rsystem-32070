Rails.application.routes.draw do
  devise_for :users
  root to: "reservations#index"
  resources :reservations, only: [:show, :new, :create]
  resources :staffs, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index]
  resources :purposes, only: [:index]
end
