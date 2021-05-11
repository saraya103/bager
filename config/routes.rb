Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :notes, only: [:index, :new, :create], param: :character
  resources :users
end