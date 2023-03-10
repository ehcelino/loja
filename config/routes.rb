Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products, only: [:show, :update, :edit, :create, :new] do
    member do
      delete :delete_image
    end
  end
  resources :users
  resources :sessions
  resources :categories
  resources :sales
  namespace :admin do
    resources :dashboard
  end
  
  root "home#index"
  get 'search', to: 'products#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'admin/list', to: 'admin#list'
  get 'checkout/:id', to: 'carts#checkout', as: 'checkout'
  get 'final', to: 'carts#final', as: 'final'
  get 'promo', to: 'categories#promo', as: 'promo'
  get 'remove/:id', to: 'carts#remove', as: 'remove'
  get 'admin/sales', to: 'admin#sales'
  get 'hole', to: 'users#hole'
  delete '/products/:id', as: 'delete', to: 'products#destroy'

  #resources :admin, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # match '*path', to: 'application#render_404', via: :all
end
