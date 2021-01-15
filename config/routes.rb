Rails.application.routes.draw do
  get 'sessions/new'
  get  '/signup', to: 'users#new'
  root 'top_page#home'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :microposts, only: [:create, :destroy]
  resources :tasks
  get '/congratulations', to: 'users#congratulations'
  resources :footprints
  get '/graduate', to: 'graduate#graduatepage'
end
