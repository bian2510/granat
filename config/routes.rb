Rails.application.routes.draw do
  devise_for :admins

  root to: "main#index"
  
  resources :properties
  resources :addresses
  resources :property_features
  resources :amenities
  resources :property_images
end
