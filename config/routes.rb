Rails.application.routes.draw do
  # get "plants/new"
  # get "plants/index"
  # get "plants/show"
  # get "plants/edit"
  resources :plants

  resources :masurements
  resources :costs
  resources :alerts
  # devise_for :admins
  # devise_for :users
  
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  #単数形？

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  } 
  #単数形？

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "about" => "homes#about"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

end
