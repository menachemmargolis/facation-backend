Rails.application.routes.draw do

  resources :companions
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#delete'
  
  
  post '/images', to: 'images#create'
  delete '/images/:id', to: 'images#delete'

  
  post '/vacations', to: 'vacations#create'
  delete '/vacations/:id', to: 'vacations#delete'


  get '/locations/:location/:number', to: 'vacations#locations'
  
  get '/companions', to: 'companions#index'

  # resources :images
  # resources :vacations
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
