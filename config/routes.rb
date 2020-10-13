Rails.application.routes.draw do
  devise_for :users
  root to: 'exhibitions#index'
  resources :exhibitions, only: [:new, :create, :index, :show, :destroy,:edit, :update]
end
