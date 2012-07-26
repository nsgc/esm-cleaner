Cleaner::Application.routes.draw do
  root to: 'cleaner#index'
  post 'cleaner/assign'

  resources :users, only: [:new, :create]
end
