Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users,
    only: [:sessions, :confirmations],
    controllers: { sessions: 'users/sessions', confirmations: 'users/confirmations' },
    defaults: { format: :json }

  resources :users, defaults: { format: :json }
  resources :developers, only: [:index, :show], defaults: { format: :json }
  resources :employments, except: [ :new, :show, :edit ], defaults: { format: :json }
  resources :links, except: [ :new, :show, :edit ], defaults: { format: :json }
  resources :skills, except: [ :new, :show, :edit ], defaults: { format: :json }

  post '/presigned_url', to: 'direct_upload#create'

  resources :appointments, defaults: { format: :json }

end
