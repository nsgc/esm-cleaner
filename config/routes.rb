Cleaner::Application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: [:new, :create]
end
