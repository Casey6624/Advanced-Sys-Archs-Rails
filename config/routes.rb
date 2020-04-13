Rails.application.routes.draw do
  get "/search" => "products#search", :as => "search_page"
  get 'sessions/create'
  get 'sessions/destroy'
  root "static_pages#home"
  get 'products/create'
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
