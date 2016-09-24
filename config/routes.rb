Rails.application.routes.draw do
  get 'pos/index'

  root to: 'pos#index'
end
