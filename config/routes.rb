Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v0/auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v0 do
      resources :users, only: [:update] do
        member do
          get :vendor
        end
      end
      resources :categories, only: [:index, :create, :show, :update] do
        member do
          resources :services, only: [:index]
        end
      end
      resources :services do
        member do
          resources :recomendations, only: [:index]
        end
      end
      resources :vendors, only: [:create, :update]
      resources :vendor_requests, only: [:index, :create]
      resources :services, only: [:create, :show, :update]
      resources :vendor, only: [:index, :create, :show, :update] do
        member do
          resources :services, only: [:index], :controller => "vendor_services"
        end
      end
      resources :recomendations, only: [:create]
    end
  end
end
