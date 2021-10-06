Rails.application.routes.draw do

  devise_for :admins

  ##############################################################################
  # Admins
  namespace :admins do
    get '/',        to: 'dashboard#index'
    resources :products
    resources :car_models
  end

  get 'home/index'
  get 'introduces/about_us', to: 'introduce#about_us'
  get 'introduces/super_handsome_developer', to: 'introduce#developer', as: :introduces_developer

  resources :car_models
  resources :products do
    get '/:slug', on: :collection, to: 'products#show'
  end
  resources :contacts

  root 'home#index'
end
