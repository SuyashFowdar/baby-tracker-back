# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users/all'
  # get 'users/:id', to: 'users#show'
  post 'users/create'
  post 'users/login'
  get 'users/admin'
  post 'measures/create'
  post 'measurements/create'
  get 'measurements/fetch'
  root 'users#index'
end
