Rails.application.routes.draw do
  resources :postimages
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get  'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
  resources :users do
    member do
      get 'followers'
      get 'followings'
    end
  end  
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
