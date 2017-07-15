Rails.application.routes.draw do
  resources :categories
  resources :books do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  root 'home#index'
  get 'home/index'
  get 'home/contact'
  get 'home/about'

  devise_for :users, :controllers => { registrations: 'registrations' }
end
