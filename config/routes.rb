Rails.application.routes.draw do
  get 'top/index'
  
  resources :members
  resources :orders
  resources :items
  resources :regulars
  resources :categories
  resources :orderitems
  
end
