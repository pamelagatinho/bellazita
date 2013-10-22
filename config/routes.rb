Bellazita::Application.routes.draw do
  
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  resources :users 
  resources :clients
  resources :sessions
  resources :password_resets
  
  
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => "home#index"
end
