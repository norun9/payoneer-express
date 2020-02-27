Rails.application.routes.draw do
  root 'payees#index'

  resources :payees do
    member do
      get 'confirm'
      post 'pay'
    end
  end
end
