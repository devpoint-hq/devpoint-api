Rails.application.routes.draw do
  resources :users, defaults: { format: :json } do
    resources :appointments, defaults: { format: :json }
  end

  resources :sessions, only: [:create, :destroy], defaults: { format: :json }
  
  resources :developers, only: [:index, :show], defaults: { format: :json }

  root 'pages#index'
end
