Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v0/auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v0 do
      resources :users
      resources :categories, only: [:index, :create, :show, :update]
      resources :vendors, only: [:index, :show]
    end
  end
end
