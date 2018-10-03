Rails.application.routes.draw do
  root 'notes#home'
  resources :notes, except: [:show] do
    collection do
      post :confirm
    end
  end
end
