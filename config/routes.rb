Rails.application.routes.draw do
  devise_for :users
  root to: 'exhibitions#index'
  resources :exhibitions, only: :new
end
