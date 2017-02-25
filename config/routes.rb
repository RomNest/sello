Rails.application.routes.draw do
  resources :orders
  resources :carts
  resources :order_posts

  devise_for :users
  
  resources :posts do
    
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end

  	resources :comments
  end

  resources :categories
  resources :welcome


  root 'posts#index'
  resources :users, :only => [:show]
end
