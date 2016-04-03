Rails.application.routes.draw do

  get 'users/new' => 'users#new', as: :sign_up
  get '/users' => 'users#index', as: :users
  get '/users/:id/profile' => 'home#dashboard', as: :dashboard
  get '/users/:id' =>'users#show', as: :user
  post '/users' => 'users#create'

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete', as: :sign_out

  get 'post/:id' => 'post#detail', as: :post
  get 'newposts' => 'post#new', as: :new
  post 'posts/dashboard' => 'posts#create', as: :posts


  post 'user/:id/follow' => 'follow#create', as: :follow_user
  post 'user/:id/stop-follow' => 'follow#delete', as: :stop_follow_user

  root 'home#dashboard'

end
