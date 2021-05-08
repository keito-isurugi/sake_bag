Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/terms_of_service', to: 'static_pages#terms_of_service'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/post_review_form', to: 'post_reviews#post_review_form'
  get 'users/:id/likes', to: 'users#likes'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :post_reviews, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end
  resources :post_reviews, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users
  resources :post_reviews
  resources :guest_sessions, only: :create
  resources :post_reviews, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
