Rails.application.routes.draw do

  devise_for :admins

  ##############################################################################
  # Admins
  namespace :admins do
    get '/',        to: 'dashboard#index'
    resources :products
    resources :car_models
    resources :contacts
    resources :posts
  end

  resources :car_models, only: [:show] do
    get '/:slug', on: :collection, to: 'car_models#show'
  end

  resources :products, only: [:show, :index] do
    get '/:slug', on: :collection, to: 'products#show'
  end

  resources :contacts, only: [:index, :create]

  get 'tin-tuc/:slug', to: 'posts#show', as: :post
  get 'tin-tuc', to: 'posts#index', as: :posts

  get 'introduces/about_us', to: 'introduce#about_us'
  get 'introduces/super_handsome_developer', to: 'introduce#developer', as: :introduces_developer

  root 'home#index'
end
