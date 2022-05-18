Rails.application.routes.draw do
  root to: 'static_pages#top'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]
  resources :coping_lists do
    resources :copings do
      resources :histories, only: %i[index new create show destroy], shallow: true
      collection do
        get :others
        get :copy
        get '/shuffle', to: 'selections#shuffle'
        get '/high_late', to: 'selections#high_rate'
        get '/never_done', to: 'selections#never_done'
      end
    end
    get 'histories', on: :member
  end
end