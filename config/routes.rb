Rails.application.routes.draw do
  root to: "homes#top"
  get "/homes/about", as: "about"
  devise_for :users
  resources :post_images, only: [:index, :show, :new, :create, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
