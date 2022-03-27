# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notifications
  devise_for :users

  resources :tweets do
    resources :replies
    resources :retweets
    resources :likes, only: [:create]
  end

  resources :replies do
    resources :replies
    resources :retweets
    resources :likes, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :users do
    resources :relations, only: [:create]
  end

  resources :relations, only: [:destroy]
  resources :likes, only: [:destroy]

  resources :conversations do
    resources :messages
  end
end
