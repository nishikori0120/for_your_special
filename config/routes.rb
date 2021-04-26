Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    patch 'users', to: 'users/registrations#update'
    patch 'addresses', to: 'users/registrations#address_update'
  end
  root 'orders#index'
  resources :orders, only: [:new, :create,]
  get 'order/comfimation', to: 'orders#comfimation'
  get 'order/select_address', to: 'orders#select_address'
  post 'order/add_address', to: 'orders#add_address'
  post 'order/order_end', to: 'orders#order_end'
  get 'users/address_edit', to: 'users#address_edit'
  resources :cards, only: [:new, :create]
  resources :users, only: [:show, :edit]
end
