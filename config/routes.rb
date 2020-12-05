Rails.application.routes.draw do
  devise_for :users
  root to: "reservations#index"
  resources :reservations, only: [:index, :show, :new, :create]
  resources :staffs, only: [:index, :new, :create]
  resources :items, only: [:index]
  resources :purposes, only: [:index]
end
