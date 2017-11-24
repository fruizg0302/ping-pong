Rails.application.routes.draw do
  resources :matches

  devise_for :users
  root to: "home#index"
  get '/history', to: 'matches#index'
  get '/log',     to: 'matches#new'
end
