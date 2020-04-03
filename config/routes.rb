Rails.application.routes.draw do
  get 'products/create'
  get 'books/create'
  get 'static_pages/home'
  root "static_pages#home"
  get 'static_pages/aboutus'
  get 'static_pages/contactus'
  get 'static_pages/products'

  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
