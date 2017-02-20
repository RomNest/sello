Rails.application.routes.draw do
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :users
  
  resources :posts do
    
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end

  	resources :comments
  end

  resources :categories
  
  root 'posts#index'

  resources :users, :only => [:show]
end
