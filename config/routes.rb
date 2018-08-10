Rails.application.routes.draw do
  get 'time_logs/index'

  get 'time_logs/new'

  get 'time_logs/create'

  get 'time_logs/edit'

  get 'time_logs/update'

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
    resources :payments
    resources :assign_users
    resources :comments
    resources :time_logs, shallow: true
  end
end
