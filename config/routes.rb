Rails.application.routes.draw do
  get 'buyers/index'
  devise_for :users

  root to: "products#index"

  resources :products

end
