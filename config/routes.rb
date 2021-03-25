Rails.application.routes.draw do
  resources :users, defaults: { format: :json } do
    resources :appointments, defaults: { format: :json }
  end

  resources :developers, only: :index, defaults: { format: :json }

  root 'pages#index'
end
