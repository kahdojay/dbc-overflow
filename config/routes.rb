Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/search', to: 'welcome#search'
  get '/signup', to: 'users#new'

  resources :users
  resources :comments
  resources :votes
  resources :questions do
    resources :answers
  end
end
