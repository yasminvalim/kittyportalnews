
Rails.application.routes.draw do
  devise_for :users

  resources :admin_backoffice, only: [:index]

  namespace :admin_backoffice do
    resources :posts
    resources :users, only: [:index, :edit, :update, :destroy, :show]
    resources :comments, only: [:new, :edit, :create, :update, :destroy]
  end

  resources :posts, only: [:index, :show]
  resources :comments, only: [:new, :edit, :create, :update, :destroy]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'admins_backoffice', to: 'admin_backoffice#index'

  root to: "welcome#index"
end
