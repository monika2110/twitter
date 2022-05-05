# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bookmarks
  devise_for :users
  resources :conversation_users
  resources :tweets do
    resources :replies
    resources :likes, only: [:create]
    resources :bookmarks, only: [:create]

  end

  resources :replies do
    resources :replies
    resources :likes, only: [:create]
    resources :bookmarks, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index', via: :all

  resources :users do
    resources :relations, only: [:create]
  end

  resources :relations, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :bookmarks, only: [:destroy]

  resources :conversations do
    resources :messages
    collection do
      get :new_group
    end
  end

  resources :notifications

end
