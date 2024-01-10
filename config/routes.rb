Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :orders, only: [:new, :index, :create, :show] do
    patch :process_ord, on: :member
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'orders#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
