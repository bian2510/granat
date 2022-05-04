Rails.application.routes.draw do
  devise_for :admins

  root to: "main#index"

  get '/about_us', to: 'main#about_us'

  get '/properties/filter', to: 'properties#filter'
  
  resources :properties
  resources :addresses
  resources :property_features
  resources :amenities
  resources :property_images
end
