Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  get '/dealerships/:id', to: 'dealerships#show'

  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'

  get '/dealerships/:dealership_id/cars', to: 'dealershipcars#index'

end
