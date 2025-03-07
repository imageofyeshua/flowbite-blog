Rails.application.routes.draw do
  resource :session
  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :posts, only: [:new, :create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  root "posts#index"
end
