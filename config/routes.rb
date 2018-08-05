Rails.application.routes.draw do
  get 'payments/new'

  get 'payments/edit'

  devise_for :users
  resources :clients
  resources :projects
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
  resources :projects do
    member do
      get 'mark_complete'
    end
  end
  
  resources :projects do
    resources :payments
  end
  
  resources :projects do
    resources :assign_users
  end
  
end
