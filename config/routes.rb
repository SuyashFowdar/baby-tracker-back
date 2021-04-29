# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :admins, only: [:index]
  resources :measurements, only: [:create, :index]
  resources :measures, only: [:create]
end
