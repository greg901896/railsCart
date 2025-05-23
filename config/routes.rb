Rails.application.routes.draw do
  resources :cats
  devise_for :users
  resources :gregs
  
  get 'products/total_news', to: 'products#total_news'
  
  resources :candidates do
    member do
      post :vote
      end
    end
  
  resources :orders do
    collection do
      get "code"
    end
  end

  resources :newgregs do
  end

  resources :homes do
    collection do
      get 't1'
      get 't2'
      get "t3"
    end
  end

  get "test" , to:"products#test"
  
  resources :products do 
    member do 
      post :plus_cart
      
    end
    collection do
       post :test , path: "test/:id"
       get :titles #, path: "titles/:id"
    end 
    end

  resources :users do
  end

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
      get :checkout
      get :submit 
    end
  end
  
  get "up" => "rails/health#show", as: :rails_health_check
  root "homes#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
