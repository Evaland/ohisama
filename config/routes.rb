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
  post '/add_item' => 'orderitems#add_item'

  resources :members do 
    resources :orders
  end
  resources :orders do
    get '/my_cart' => 'orderitems#my_cart'
    post '/add_item' => 'orderitems#add_item'
    post '/update_item' => 'orderitems#update_item'
    delete '/delete_item' => 'orderitems#delete_item'
  end

  resources :items do
    get "search", on: :collection
    resources :categories
    resources :orderitems
  end
  resources :categories
  resources :regulars
  resources :orderitems

  
  resource :session, only: [:create, :destroy]

end
