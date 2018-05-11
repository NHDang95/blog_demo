Rails.application.routes.draw do
  resources :microposts

  resources :comments
  get '/login', to:'sessions#new'

  post '/login', to:'sessions#create'

  delete '/logout', to:'sessions#destroy'

  root 'static_pages#home'

  get '/help', to:'static_pages#help'

  get '/about', to:'static_pages#about'

  get  '/signup',  to: 'users#new'

  post '/signup',  to: 'users#create'

  resources :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :comments do
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
