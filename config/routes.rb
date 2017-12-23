Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:edit]
  resources :reviews
  resources :post_images, only: [:new, :create, :index, :show]
  get '/about' => 'reviews#about'
  root 'reviews#top'
end