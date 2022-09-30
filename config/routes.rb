Rails.application.routes.draw do
  devise_for :users
  # get 'comments/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create new destroy]
      resources :likes, only: %i[create destroy]
    end
  end
  post 'users/:user_id/posts/post_:id/create_like', to: 'likes#create', as: 'like_create'
  get 'users/index'
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
  root 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, param: :_user_id
  post 'api/login', to: 'authentication#login'
 
  namespace :api, defaults: { format: :json } do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index show] do
          resources :comments, only: %i[index show create]
        end
      end
    
  end
end
