Rails.application.routes.draw do
  root 'items#index'

  get '/search', to: 'search#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api, constraints: { format: 'json' }  do
    namespace :v1 do
      resources :items, only: [:index, :show, :destroy, :create]
    end
  end
end
