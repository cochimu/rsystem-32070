Rails.application.routes.draw do
  devise_for :users
  root to: "covers#index"
  resources :reservations, only: [:new, :create, :edit, :update, :destroy]
  resources :staffs, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index, :new, :create, :destroy]
  resources :purposes, only: [:index, :new, :create, :destroy]
end
