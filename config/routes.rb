Rails.application.routes.draw do

  get 'sells/finish' => "sells#finish"

  resources :line_items
  resources :carts

  namespace :admin do
    get 'sells/index'
    get 'sells/show'
    get 'sells/update'
  end
  devise_for :users
  devise_for :admins

  resources :sells
  resources :users
  resources :cart_items
  resources :products
  resources :artists
  resources :labels
  resources :genres
  resources :ships

  namespace :admin do
    resources :products
    resources :artists
    resources :labels
    resources :users
    resources :orders
    resources :sells

  end

  root to: 'products#index'
  get 'search', to: 'products#search'
  get'admin/top' => 'admin/top#top'
  get 'about' => 'home#about'
  get 'sells/create_conf' => "sells#create_conf"
  post 'sells/create_conf' => "sells#create_conf"
  patch 'sells/create_conf' => "sells#create_conf"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
