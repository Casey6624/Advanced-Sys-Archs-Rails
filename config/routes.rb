Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  #match "products/:product_id", "products#product_reviews", via :get
  root "static_pages#home"
  #match "/products" to "static_pages/products"
  get 'products/create'
  get 'static_pages/home' 
  get 'static_pages/aboutus'
  get 'static_pages/contactus'
  get 'static_pages/products'

  resources :sessions
  resources :users
  resources :products
  resources :profiles
  resources :reviews
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
