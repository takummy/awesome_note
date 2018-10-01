Rails.application.routes.draw do
  resources :notes do 
    collection do
      :confirm
    end
  end
end
