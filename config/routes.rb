Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :background, only: [:index, :show]
      resources :forecast, only: [:index, :show]
      resources :users, only: [:create, :update]
      resources :sessions, only: [:create, :update]
    end
  end
end
