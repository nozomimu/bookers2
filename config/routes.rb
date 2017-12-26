Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :reviews
  get '/about' => 'reviews#about'
  resources :post_images
  delete '/destroy/:id' => 'post_images#destroy', as: 'destroy_post'
  get '/posts/edit/:id' => 'post_images#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts_#update', as: 'update_post'
  root 'reviews#top'
  get '/books' => 'post_images#books'
end