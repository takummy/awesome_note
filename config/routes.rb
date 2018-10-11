Rails.application.routes.draw do
  root 'notes#home'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :notes, except: [:show] do
    collection do
      post :confirm
    end
  end

  resources :feeds
end
