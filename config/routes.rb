Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, path: '/', only: %w[show new create] do
    resources :bookmarks, only: %w[new create]
    resources :reviews, only: %w[new create]
  end
  resources :bookmarks, only: %w[destroy]
end
