Bellazita::Application.routes.draw do
  
  resources :users 
  resources :clients
  
  
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => "home#index"
end
