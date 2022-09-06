Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :properties
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :api do

    resources :favorites, only: [:create, :destroy]
  end


  resources :properties

  post "checkout/create", to:"checkout#create"


  resources :passwords, only: [:show, :update]



  put "/hostify/:user_id" => "hostify#update", as: :hostify


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

  # Defines the root path route ("/")
  # root "articles#index"
end
