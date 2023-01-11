Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  resources :users
  resources :sessions
  resources :categories
  
  root "home#index"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'admin/list', to: 'admin#list'
  get 'checkout/:id', to: 'carts#checkout', as: 'checkout'

  #resources :admin, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # match '*path', to: 'application#render_404', via: :all
end
