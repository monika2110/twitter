# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes
  devise_for :users
  resources :tweets do
    resources :replies
    resources :likes, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'

  resources :users do
    resources :relations, only: [:create]
  end
  resources :relations, only: [:destroy]
  resources :likes, only: [:create, :destroy]




end
