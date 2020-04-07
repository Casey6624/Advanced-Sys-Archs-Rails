Rails.application.routes.draw do
  get 'users/create'
  root "static_pages#home"
  #match "/products" to "static_pages/products"
  get 'products/create'
  get 'static_pages/home' 
  get 'static_pages/aboutus'
  get 'static_pages/contactus'
  get 'static_pages/products'

  resources :users

  # I think everything after "do" can be deleted
  # remove when dummy data is in the products table
  resources :products
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
