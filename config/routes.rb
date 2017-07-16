Rails.application.routes.draw do
  get 'home/index'
  get 'home/contact'
  get 'home/about'

  devise_for :users, :controllers => { registrations: 'registrations' }

  namespace :admin do
    root 'dashboard#index'
    resources :categories
  end

  scope module: 'frontend' do
    root 'home#index'
    resources :categories
    resources :books do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
