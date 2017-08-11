Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only:[:index, :new, :create, :edit, :update,] do
    resources :messages, only:[:create, :index]
 end
end


