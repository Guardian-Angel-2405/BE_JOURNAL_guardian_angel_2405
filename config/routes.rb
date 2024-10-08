Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do 
    namespace :v0 do 
      get "/affirmations", to: "affirmations#index"
      post "/gratitudes", to: "gratitudes#create"
      get "/gratitudes/:user_id/dates", to: "gratitudes#index"
      get "/gratitudes/:user_id/dates/:date", to: "gratitudes#show"
      delete "/gratitudes/:id", to: "gratitudes#destroy"
    end
  end
end
