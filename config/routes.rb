
Rails.application.routes.draw do
  devise_for :users

  resources :admin_backoffice, only: [:index] do
    collection do
      resources :posts, only: [:new, :edit, :create, :update, :destroy]
      resources :users, only: [:new, :edit, :create, :update, :destroy]
    end
  end

  resources :posts, only: [:index, :show]
end
