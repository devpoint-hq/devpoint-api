Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions: 'users/sessions'}, defaults: { format: :json }

  resources :users, defaults: { format: :json }
  resources :developers, only: [:index, :show], defaults: { format: :json }
  resources :jobs, except: [ :new, :show, :edit ], defaults: { format: :json }
  resources :links, except: [ :new, :show, :edit ], defaults: { format: :json }
  resources :skills, except: [ :new, :show, :edit ], defaults: { format: :json }

  post '/presigned_url', to: 'direct_upload#create'

  resources :appointments, defaults: { format: :json }

end
