Rails.application.routes.draw do
  resources :gregs
  resources :candidates do
    member do
      post :vote
      
      end
    end
  
  resources :newgregs do
    end

  get "test" , to:"products#test"
  

  resources :products do 
    member do 
      post :plus_cart
      post :test 
    end
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
