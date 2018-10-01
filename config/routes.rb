Rails.application.routes.draw do
  root 'notes#home'
  resources :notes do
    collection do
      post :confirm
    end
  end
end
