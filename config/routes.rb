Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
  end
end
