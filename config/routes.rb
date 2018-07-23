Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'homepage#index'
 
  namespace :admin do
    root to:'admin#index'
    
    resources :admin do
      member do
        get 'change_status'
      end
    end
    resources :admin do
      member do
        get 'promote_to_maneger'
      end
    end
  end
  

end
