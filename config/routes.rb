Rails.application.routes.draw do
  root 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'
  
  post 'users' => 'users#create'
  get 'dashboard/:id' => 'users#show'

  get 'products' => 'products#index'
  post 'products' => 'products#create'
  post 'products/:id' => 'products#buy'
  delete 'products/:id' => 'products#destroy'
end
