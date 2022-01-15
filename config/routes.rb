Rails.application.routes.draw do
  namespace :admin do
    root 'top#index'
    resources :members
    resources :orders
    resources :items do
      get "search", on: :collection
      resources :categories
    end
    resources :regulars
    resource :session, only: [:create, :destroy]
  end
  root "top#index"
  get "about" => "top#about", as:"about"
  
  resources :members
  resources :orders
  resources :items do
    get "search", on: :collection
    resources :categories
  end
  resources :categories
  resources :regulars
  resources :orderitems
  resource :session, only: [:create, :destroy]

end
