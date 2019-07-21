Rails.application.routes.draw do



  namespace :admin do
    get 'sells/index'
    get 'sells/show'
    get 'sells/update'
  end
  get 'sells/new'
  get 'sells/create'
  get 'sells/show'
  get 'sells/finished'
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

  end

  root to: 'products#index'
  get'admin/top' => 'admin/top#top'
  get 'about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
