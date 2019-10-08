Rails.application.routes.draw do
  resources :schedules
  resources :routes
  resources :vehicles
  resources :drivers


get 'resolve_routes', to: 'routes#resolve'
root :to => "routes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
