Rails.application.routes.draw do

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
