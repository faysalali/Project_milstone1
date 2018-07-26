Rails.application.routes.draw do
  devise_for :users
  resources :clients
  root 'homepage#index'
  namespace :admin do
    root to:'admin#index'
    resources :admin do
      member do
        get 'change_status'
        get 'promote_to_manager'
      end
    end
  end
end
