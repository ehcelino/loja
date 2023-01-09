Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions
  root "home#index"
  #resources :admin, only: [:index]
  get 'admin/list', to: 'admin#list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
