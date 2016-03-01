Rails.application.routes.draw do
  resources :posts
  resources :comments, only: :create
  resources :categories
  resources :static_pages, only: :index
  root 'static_pages#index'
end
