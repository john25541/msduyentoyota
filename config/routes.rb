Rails.application.routes.draw do

  get 'car_models/show'
  get 'introduce', to: 'introduce#index'
  get 'home/index'

  resources :products
  resources :contacts do
    collection do
      get :finish
    end
  end

  root 'home#index'
end
