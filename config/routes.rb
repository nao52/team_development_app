Rails.application.routes.draw do
  root "static_pages#top"

  resources :users, only: %i[new create index edit update destroy]
  resources :articles

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
