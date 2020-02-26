Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about'
  resources :users do
    member do
     get :following, :followers
    end
  end

  resources :relationships,only: [:create, :destroy]

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]

  end

end