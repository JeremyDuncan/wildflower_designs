Rails.application.routes.draw do
  devise_for :users
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

  get 'home/index'
  root 'home#index'

  namespace :admin do
    get '/', to: 'dashboard#index', as: :admin_root # This creates the path '/admin'
  end
end