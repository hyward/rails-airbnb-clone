Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/allfavorites', to: 'pages#favorites', as: 'allfavs'
  get '/allcars', to: 'pages#cars', as: 'allcars'
  resources :cars do
    resources :bookings, only: [:create]
    resources :favorites, only: [:new, :create]
  end
  resources :favorites, only: [:destroy]
  resources :bookings, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
