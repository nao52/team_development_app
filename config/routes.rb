Rails.application.routes.draw do
  root "static_pages#top"

  resources :users, only: %i[new create]
  resources :articles do
    resources :comments, only: %i[create], shallow: true
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
