Rails.application.routes.draw do
  resources :lists, only: %w[index show new create] do
    resources :bookmarks, only: %w[new create]
  end
  resources :bookmarks, only: %w[index destroy]
end
