Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :create] do
        resources :subscriptions, only: [:index, :create, :update]
      end
      resources :teas, only: [:index]
    end
  end
end
