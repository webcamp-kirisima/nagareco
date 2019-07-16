Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  resources :orders
  resources :users
  resources :cart_items
  resources :products
  resources :admin_order
  resources :admin_products
  resources :admin_users

  root to: 'products#index'
  get 'top' => 'products#top'
  get 'about' => 'products#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end