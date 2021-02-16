Rails.application.routes.draw do

  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#delete'
  
  
  post '/images', to: 'images#create'
  delete '/images/:id', to: 'images#delete'

  
  post '/vacations', to: 'vacations#create'
  delete '/vacations/:id', to: 'vacations#delete'


  get '/locations/:location/:number', to: 'vacations#locations'
  
  `https://api.unsplash.com/search/photos?client_id=key-used-to-be-here&query=${location}&page=1&per_page=3`

  # resources :images
  # resources :vacations
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
