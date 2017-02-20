Rails.application.routes.draw do
  resources :carts
  resources :order_posts
  resource :cart, only: [:show]
  resources :order_posts, only: [:create, :update, :destroy]

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
