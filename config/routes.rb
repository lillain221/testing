Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :api do
    get "/users_by_email" => "users_by_emails#show", as: :users_by_email

    resources :favorites, only: [:create, :destroy]
  end
  get '/properties/new'
  get "/properties/search" => "properties/search#index"

  resources :properties, only: :show do
    resources :reservations, only: :new, controller: "properties/reservations"
  end

  resources :reservation_payments, only: :create
  post "checkout/create", to:"checkout#create"
  resources :profiles, only: [:show, :update]

  resources :accounts, only: [:show, :update]

  resources :passwords, only: [:show, :update]

  resources :payments, only: :index

  put "/hostify/:user_id" => "hostify#update", as: :hostify

  namespace :host do
    get "/dashboard" => "dashboard#index", as: :dashboard

    resources :properties, only: [:new, :create]

    resources :payments, only: :index
  end
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/update'
  post 'cart/remove'
  post 'cart/go'
  get 'cart/confirm'
  get 'cart/order_summery'
  get "search/:postal_code" => "search#postal_code"
  resources :like do
    member do
      get :index
    end
  end
  resources :webhooks, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
