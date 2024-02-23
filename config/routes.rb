Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Users routes
  devise_for :users, controllers: {
    sessions: 'custom_sessions',
    registrations: 'custom_registrations'
  }
  
  # Posts routes
  resources :posts do
    # Nested comments routes
    resources :comments, except: [:index, :show]
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
