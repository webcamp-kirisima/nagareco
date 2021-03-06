Rails.application.routes.draw do

  get 'sells/finish' => "sells#finish"
  get'admin/top' => 'admin/top#top'

  resources :line_items
  resources :carts

  namespace :admin do
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
  get 'about' => 'home#about'
  get 'sells/create_conf' => "sells#create_conf"
  post 'sells/create_conf' => "sells#create_conf"
  patch 'sells/create_conf' => "sells#create_conf"
  patch 'adimin/sells/:id' => "admin/sells#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
