Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions: 'users/sessions'}

  resources :users, defaults: { format: :json }

  resources :appointments, defaults: { format: :json }

  resources :developers, only: [:index, :show], defaults: { format: :json }
end
