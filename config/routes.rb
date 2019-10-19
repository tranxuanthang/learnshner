Rails.application.routes.draw do
  resources :bookmarks, only: %i(index create destroy)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :create, format: :json
  resources :user_sessions, only: [:create, :destroy], format: :json
  resources :user, only: :index, format: :json
  resources :users, format: :json do
    resources :test_records, only: %i(index), format: :json
  end
  resources :users do
    resources :tests, only: %i(index), format: :json
  end

  resources :tests, except: %i(new edit), format: :json
  resources :test_records, format: :json
  resources :categories, except: %i(new edit), format: :json
  resources :languages, except: %i(new edit), format: :json
end
