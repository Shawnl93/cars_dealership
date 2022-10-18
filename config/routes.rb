Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  get '/dealerships/:id', to: 'dealerships#show'
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships/:id/edit', to: 'dealerships#edit'
  patch '/dealerships/:id', to: 'dealerships#update'

  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get 'cars/:id/edit', to: 'cars#edit'
  patch 'cars/:id', to: 'cars#update'

  get '/dealerships/:dealership_id/cars', to: 'dealershipcars#index'
  get '/dealerships/:dealership_id/cars/new', to: 'dealershipcars#new'
  post '/dealerships/:dealership_id/cars', to: 'dealershipcars#create'


end
