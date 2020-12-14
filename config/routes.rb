Rails.application.routes.draw do
  devise_for :users
  root to: "reservations#index"
  resources :reservations, only: [:show, :new, :create, :edit, :update]
  resources :staffs, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index, :new, :create, :destroy]
  resources :purposes, only: [:index, :new, :create, :destroy]
end
