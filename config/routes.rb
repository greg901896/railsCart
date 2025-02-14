Rails.application.routes.draw do
  resources :gregs
  resources :candidates do
    member do
      post :vote
      end
    end
  
  resources :newgregs do
    end


  resources :products do 
    end

  resources :users do
  end

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
