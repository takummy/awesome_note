Rails.application.routes.draw do
  root 'notes#home'
  resources :notes do
    collection do
      :confirm
    end
  end
end
