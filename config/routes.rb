Rails.application.routes.draw do
  get 'pos/index'

  namespace :api do
    resources :locate, only: :[] do
      member do
        get :beacon
        get :barcode
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
    resources :api_requests, only: :index do
    end
  end

  root to: 'pos#index'
end
