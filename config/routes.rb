Rails.application.routes.draw do
  root "static_pages#top"
  resources :articles do
    resources :comments, only: %i[create], shallow: true
end
