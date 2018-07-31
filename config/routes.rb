Rails.application.routes.draw do
  devise_for :users
  resources :clients
  root 'homepage#index'
  
  namespace :admin do
    root to:'admin#index'
    
    resources :users do
      member do
        get 'update_status'
        get 'update_role'
      end
    end
    
  end
end
