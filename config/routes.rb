Cleaner::Application.routes.draw do
  root to: 'cleaner#index'
  post 'cleaner/assign'
  post 'cleaner/init'

  resources :users, only: [:new, :create, :index] do
    post :seated_change
  end
end
