Rails.application.routes.draw do
  resources :posts do
    resources :comments, on: :collection
  end
  resources :categories
  resources :static_pages, only: :index
  root 'static_pages#index'
end
