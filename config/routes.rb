Bellazita::Application.routes.draw do
  
 # get "sessions/new"
  #get "users/new"
  #get "password_resets/create"
  #get "password_resets/edit"
  #get "password_resets/update"
  resources :users 
  resources :products
  resources :clients do
    get :sort, on: :collection
    resources :orders
  end

  resources :orders, only: [:none] do
    post :add_product
  end

  resources :sessions
  resources :password_resets
  
  
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => "clients#index"

  get "secret" => "home#secret", :as => "secret"
  
end
