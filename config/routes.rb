CourseProject::Application.routes.draw do
  root to: "posts#index"

  get 'register', to: 'users#new', as: 'register'
  get 'profile', to: 'users#show', as: 'profile'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:create]
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end
end
