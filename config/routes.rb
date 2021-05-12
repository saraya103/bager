Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :notes, only: [:index, :new, :create, :show], param: :character
  resources :users, only: [:edit, :update]
end