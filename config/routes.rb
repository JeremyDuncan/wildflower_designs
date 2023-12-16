Rails.application.routes.draw do
  # devise_for :users
  # config/routes.rb

  devise_for :users, controllers: { registrations: 'custom_registrations' }

  # get 'contacts/new'
  # get 'contacts/create'
  resources :contacts, only: [:new, :create]

  resources :products do
    resources :images, only: [:new, :create]
  end

  get 'static_pages/about_me'
  get 'static_pages/contact'

  get 'about_me', to: 'static_pages#about_me'
  get 'contact', to: 'static_pages#contact'

  resources :images
  resources :products
  resources :pages

  resources :cart_items
  post 'update_cart', to: 'cart_items#update_cart'

  resources :cart_items do
    post :request_invoice, on: :collection
  end

  post 'add_address', to: 'users#add_address'

  get 'home/index'
  root 'home#index'

  namespace :admin do
    get '/', to: 'dashboard#index', as: :admin_root # This creates the path '/admin'
  end
end