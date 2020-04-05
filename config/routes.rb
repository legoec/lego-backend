Rails.application.routes.draw do
  root to: redirect("/api-docs")
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v0 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users
      resources :categories, only: [:index]
    end
  end
end
