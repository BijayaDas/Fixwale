Rails.application.routes.draw do


  resources :categories
  resources :providers
  resources :enquiries
  resources :replies
  # resources :languages
  resources :messages, only: [:new, :create]
  post '/rate' => 'rater#create', :as => 'rate'
  # resources :payments
  resources :bookings do
    member do
      get :cancel
    end
  end
  match "/bookings/:id/edit" => "bookings#edit", via: [:get, :post, :put, :patch]
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :comments, only: [:create]
  # resources :addresses
  # resources :roles
  resources :domains, only: [:show]
  # resources :background_details
  # resources :skills
  # resources :sub_categories
  # resources :categories
  resources :homes do

    collection do
      get :search
    end
    
  end
    
  
  root to: "homes#index"
  
end
