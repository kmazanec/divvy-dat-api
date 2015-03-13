Rails.application.routes.draw do

  resources :stations, only: %i[index show]
  resources :trips, only: %i[index show]

end
