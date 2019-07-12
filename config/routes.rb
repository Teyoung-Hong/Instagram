Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users
  resources :posts do
    resource :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :relationships, only: [ :create, :destroy ]
end
