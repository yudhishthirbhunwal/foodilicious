Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  resources :users, only: [:index, :show, :destroy]
  resources :food_items
  resources :orders, only: [:index, :create, :destroy]
end
