Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  resources :questions do
    resources :answers
  end
end
