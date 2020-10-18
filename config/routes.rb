Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    get 'signup', to: 'users#new'
    resources :users do
      member do
        get :newlog
        get :followings
        get :followers
        get :likes
        get :map
      end
    end 
    
    post '/likes/:id', to: 'likes#create'
    delete '/likes/:id', to: 'likes#destroy'
    
    resources :logs, only: [:new, :create, :edit, :update, :destroy, :show]
    resources :relationships, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
end
