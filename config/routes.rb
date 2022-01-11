Rails.application.routes.draw do
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
