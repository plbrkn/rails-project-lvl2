# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :posts, only: %i[show new create] do
    resources :comments, only: :create
    resources :likes, only: %i[create destroy]
  end
end
