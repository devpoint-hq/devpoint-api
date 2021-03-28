Rails.application.routes.draw do
  resources :users, defaults: { format: :json } do
    resources :appointments, defaults: { format: :json }
  end

  get '/sessions', to: 'sessions#show'
  put '/sessions', to: 'sessions#update'

  resources :developers, only: [:index, :show], defaults: { format: :json }

  root 'pages#index'
end
