Rails.application.routes.draw do
  get "cart/show"
  resources :plants
  patch 'plants/:id' => 'plants#update', as: 'update_plant'
  delete 'plants/:id' => 'plants#destroy', as: 'destroy_plant'

  resources :costs
  resources :alerts
  
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  #単数形？
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create, :index, :show]

  devise_for :admin, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
  } 
  
  namespace :admin do
    resources :plants do
      resources :measurements, only: [:create, :edit, :update, :destroy]
    end
    get 'measurements_all', to: 'measurements#all', as: :measurements_all
  end
  #単数形？
  
  # get 'measurements_all', to: 'measurements#all', as: :measurements_all
  resources :plants, only: [:index, :show]

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
