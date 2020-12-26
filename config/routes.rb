Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  root 'top_page#home'
  resources :users
end
