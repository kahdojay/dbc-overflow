Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :questions do
    resources :answers
  end
  get '/search', to: 'welcome#search'

end
