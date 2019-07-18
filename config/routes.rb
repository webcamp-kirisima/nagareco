Rails.application.routes.draw do



  devise_for :users
  devise_for :admins

  resources :orders
  resources :users
  resources :cart_items
  resources :products
  resources :artists
  resources :labels


  namespace :admin do
    resources :products
    resources :users
    resources :orders

  end

  root to: 'products#index'
  get'admin/top' => 'admin/top#top'
  get 'about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
