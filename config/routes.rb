Rails.application.routes.draw do
  namespace :admin do
    root 'top#index'
    resources :members
    resources :orders
    resources :items
    resources :regulars
    resource :session, only: [:create, :destroy]
  end
  root "top#index"
  get "about" => "top#about", as:"about"
  
  resources :members
  resources :orders
  resources :items
  resources :regulars
  resources :categories
  resources :orderitems
  resource :session, only: [:create, :destroy]

end
