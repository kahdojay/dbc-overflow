Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/search', to: 'welcome#search'
  get '/signup', to: 'users#new'

  resources :users
  resources :comments

  post 'votes/upvote', to: 'votes#upvote'
  post 'votes/downvote', to: 'votes#downvote'
  resources :questions do
    resources :answers

  end
end