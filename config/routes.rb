Rails.application.routes.draw do
  devise_for :users
  resources :gregs
  resources :candidates do
    member do
      post :vote
      
      end
    end
  
  resources :orders do
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
      post :test 
    end
    end

  resources :users do
  end


  resources :articles do
    resources :comments, shallow: true
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
