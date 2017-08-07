Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only:[:new, :create, :edit, :update]
  root 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end


