Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :create
  resources :user_sessions, only: [:create, :destroy]
  resources :user, only: :index
  resources :users do
    resources :test_records, only: %i(index)
  end
  resources :users do
    resources :tests, only: %i(index)
  end

  resources :tests
  resources :test_records

end
