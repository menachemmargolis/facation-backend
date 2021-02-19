Rails.application.routes.draw do

  get '/users/:name', to: 'users#show'
  post '/users', to: 'users#create'
  patch '/users/:name', to: 'users#update'
  delete '/users/:id', to: 'users#delete'
  
  
  post '/images/:name', to: 'images#create'
  delete '/images/:id', to: 'images#delete'

  
  post '/vacations/:name', to: 'vacations#create'
  delete '/vacations/:id', to: 'vacations#delete'

  get '/vacations/:name', to: 'users#vacations'
  get '/locations/:location/:number', to: 'vacations#locations'
  
  get '/companions', to: 'companions#index'
  get 'locations/:id', to: 'users#images'

end
