Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions: 'users/sessions'}

  resources :users, defaults: { format: :json } do
    resources :appointments, defaults: { format: :json }
  end

  get '/sessions/validate', to: 'users#validate_session'

  resources :developers, only: [:index, :show], defaults: { format: :json }

  root 'pages#index'
end
