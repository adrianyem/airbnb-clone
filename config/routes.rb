Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :account do
    resources :offers, only: [:index]
    resources :bookings, only: [:index]
  end

  resources :offers do
    resources :bookings, only: [:create]
  end
end
