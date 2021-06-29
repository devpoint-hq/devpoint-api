Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions: 'users/sessions'}, defaults: { format: :json }

  resources :users, defaults: { format: :json }

  post '/presigned_url', to: 'direct_upload#create'

  resources :appointments, defaults: { format: :json }

  resources :developers, only: [:index, :show], defaults: { format: :json }
end
