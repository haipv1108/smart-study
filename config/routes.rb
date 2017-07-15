Rails.application.routes.draw do
  resources :books
  root 'home#index'
  get 'home/index'
  get 'home/contact'
  get 'home/about'

  devise_for :users, :controllers => { registrations: 'registrations' }
end
