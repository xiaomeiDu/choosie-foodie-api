Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'restaurants/index'
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      get 'cuisines', to: 'events#generate_cuisine_list', as: :cuisines
      resources :events, only: %i[index create show] do
        resources :event_restaurants, only: %i[index]
      end
      resources :restaurant_picks, only: %i[create]
      resources :restaurants, only: %i[index]
      resources :users, only: :update
    end
  end
end
