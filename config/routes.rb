Rails.application.routes.draw do
  resources :images
  resources :products
  resources :pages

  get 'home/index'
  root 'home#index'
end
