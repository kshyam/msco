Rails.application.routes.draw do
  
  resources :pos, only: :index do
    member do
      post :cart
    end
  end

  namespace :api do
    resources :locate, only: :[] do
      member do
        get :beacon
        get :barcode
      end
    end
    
    resources :pos, only: :[] do
      member do
        post :cart
      end
    end
  end

  resources :downloads, only: :[] do
    collection do
      get :android
      get :qr_code
    end
  end
  
  namespace :admin do
    resources :api_requests, only: :index
    
    root to: "api_requests#index"
  end

  root to: 'pos#index'
end
