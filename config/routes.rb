Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :create
  resources :user_sessions, only: [:create, :destroy]
  resources :user, only: :index
end
