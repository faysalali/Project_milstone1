Rails.application.routes.draw do
  devise_for :users
  resources :clients, only: [:index, :create, :new, :destory, :update, :edit]
  root 'homepage#index'
  
  namespace :admin do
    root to:'admin#index'
    
    resources :admin do
      member do
        get 'update_status'
        get 'update_role'
      end
    end
    
  end
end
