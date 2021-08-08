Rails.application.routes.draw do

  devise_for :admins

  ##############################################################################
  # Admins
  namespace :admins do
    get '/',        to: 'dashboard#index'
    resources :products
  end

  get 'home/index'
  get 'introduces/about_us', to: 'introduce#about_us'
  get 'introduces/super_handsome_developer', to: 'introduce#developer', as: :introduces_developer

  resources :car_models
  resources :products
  resources :contacts

  root 'home#index'
end
