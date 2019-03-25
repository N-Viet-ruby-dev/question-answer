Rails.application.routes.draw do
  root 'static_pages#home'
  get 'admin' => 'admin/static_pages#home'

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  =>  'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'following/index'
  get 'followers/index'

  resources :users do
    resources :followers, :only => [:index]
    resources :followings, :only => [:index]
  end

  resources :relationships, only: [:create, :destroy, :show]
  
  resources :categories do
    resources :lessons
  end
  resources :words
  resources :results
  resources :activities

  namespace :admin do
    resources :users do
      resources :activities
    end  
    resources :categories do
      resources :words
    end
    resources :words
  end
end
