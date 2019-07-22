Rails.application.routes.draw do



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

  end

  root to: 'products#index'
  get'admin/top' => 'admin/top#top'
  get 'about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
