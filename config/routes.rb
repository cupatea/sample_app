Rails.application.routes.draw do
  get 'songs/index'

  get 'songs/new'

  get 'songs/create'

  get 'songs/destroy'

  root                'static_page#home'
  get    'help'    => 'static_page#help'
  get    'about'   => 'static_page#about'
  get    'contact' => 'static_page#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'songs'   => 'songs#index'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :songs,               only: [:show, :new, :create, :destroy ]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
