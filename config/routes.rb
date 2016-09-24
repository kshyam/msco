Rails.application.routes.draw do
  get 'pos/index'

  namespace :api do
    resources :samples do
      collection do
        get :download
        get :qr_code
      end
    end
  end

  root to: 'pos#index'
end
