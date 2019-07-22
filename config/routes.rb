Rails.application.routes.draw do


  resources :line_items
  resources :carts

  get 'genre/new'
  get 'genre/create'
  devise_for :users
  devise_for :admins

  resources :sells
  resources :users
  resources :cart_items
  resources :products
  resources :artists
  resources :labels
  resources :genres

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
