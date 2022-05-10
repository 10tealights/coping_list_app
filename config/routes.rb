Rails.application.routes.draw do
  root to: 'static_pages#top'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]
  resources :coping_lists do
    resources :copings do
      resources :histories, only: %i[index new create show], shallow: true
      get 'others', on: :collection
      get 'copy', on: :collection
    end
    get 'histories', on: :member
  end
end