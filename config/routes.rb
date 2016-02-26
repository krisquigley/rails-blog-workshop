Rails.application.routes.draw do
  resources :posts
  resources :comments, only: :create
  resources :categories
end
