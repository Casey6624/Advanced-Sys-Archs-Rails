Rails.application.routes.draw do
  get "/search" => "products#search", :as => "search_page"
  #get "/user-reveiws" => "reviews#find_user_reveiws", :as => "find_user_reveiws"
  get 'sessions/create'
  get 'products/create'
  get "profiles/create"
  get 'sessions/destroy'
  root "static_pages#home"
  get 'static_pages/home' 
  # rewrite to remove /static_pages/ controller in the URL
  get "aboutus" => 'static_pages#aboutus'
  get "contactus" => 'static_pages#contactus'

  resources :sessions
  resources :users
  resources :products 
  resources :profiles
  resources :reviews
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
