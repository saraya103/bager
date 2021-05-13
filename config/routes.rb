Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :notes, only: [:index, :new, :create, :show], param: :character do
    resources :items
    resources :lists, only: [:index, :new, :create, :update, :destroy]
    resources :logs, only: [:index, :show]
  end
  resources :users, only: [:edit, :update]
end