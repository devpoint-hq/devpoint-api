Rails.application.routes.draw do
  root 'pages#index'
  resources :users, defaults: { format: :json }
  resource :users, only: [:update, :destroy]
end
