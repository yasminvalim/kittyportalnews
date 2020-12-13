# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :admin_backoffice, only: [:index]

  namespace :admin_backoffice do
    resources :posts, except: [:show]
    resources :users, only: %i[index edit update destroy show]
  end

  resources :posts, only: %i[index show]
  resources :comments, only: %i[new edit create update destroy]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'admins_backoffice', to: 'admin_backoffice#index'

  root to: 'welcome#index'
end
