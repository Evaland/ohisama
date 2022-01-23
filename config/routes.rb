Rails.application.routes.draw do
  namespace :admin do
    root 'top#index'
    resources :members
    resources :orders
    resources :items do
      get "search", on: :collection
      resources :categories
      resources :orderitems
    end
    resources :categories
    resources :regulars
    resource :session, only: [:create, :destroy]
  end
  root "top#index"
  get "about" => "top#about", as:"about"

  resources :members do 
    resources :orders
  end
  resources :orders do
    delete 'orders/:id' => 'orders#destroy'
  end

  resources :items do
    get "search", on: :collection
    resources :categories
    resources :orderitems
    resources :orders
  end
  resources :categories
  resources :regulars
  resources :orderitems

  get "items/:id" => "orders#create"
  
  resource :session, only: [:create, :destroy]

end
