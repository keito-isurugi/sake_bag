Rails.application.routes.draw do
  
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/terms_of_service', to: 'static_pages#terms_of_service'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/signup', to: 'users#new'
end
