Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions: 'users/sessions'}

  resources :users, defaults: { format: :json }

  resources :appointments, defaults: { format: :json }

  get '/sessions/validate', to: 'authentication#index'

  resources :developers, only: [:index, :show], defaults: { format: :json }

  root to: redirect('https://anewman15-dev-point.netlify.app/')
end
