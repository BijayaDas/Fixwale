Rails.application.routes.draw do


  namespace :employment_services do
    resources :premium_employment_services #elitmus or anyother emp agency
  end

  namespace :connecting_services do #urbanpro, upwork like something
    resources :replies
    resources :enquiries do
      collection do
        get :looking_for_work
      end
      member do
       get :report
      end
    end
  end

  namespace :staffing_services do #like randstad provide staffing services as a 3rdparty to vendor
    resources :pre_varified_resources
  end
  namespace :scheduled_services do #like practo
    resources :office_appointments
  end
  namespace :realtime_services do #like uber provide realtime services 
    resources :insta_bookings
  end
  namespace :admin do #club all admin facilities in this namespace
    resources :skills
    resources :categories
  end

  resources :insta_bookings
  resources :office_appointments
  resources :premium_employment_services
  resources :pre_varified_resources
  resources :categories
  resources :providers do
    collection do
      post :feedback
    end
	end
  resources :enquiries do
    collection do
      get :looking_for_work
    end
    member do
     get :report
    end
	end
  resources :replies
  resources :skills
  # resources :languages
  resources :messages
  post '/rate' => 'rater#create', :as => 'rate'
  # resources :payments
  # resources :bookings do
  #   member do
  #     get :cancel
  #   end
  # end
  # match "/bookings/:id/edit" => "bookings#edit", via: [:get, :post, :put, :patch]
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :users

  # resources :comments, only: [:create]
  # resources :addresses
  # resources :roles
  # resources :domains, only: [:show]
  # resources :background_details
  # resources :skills
  # resources :sub_categories
  # resources :categories
  # resources :homes do

  #   collection do
  #     get :search
  #   end

  # end


  root to: "enquiries#index"

end
