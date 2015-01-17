Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/search', to: 'welcome#search'

  resources :users
  resources :questions do
    resources :answers
  end

  resources :comments
  resources :votes
end
