Rails.application.routes.draw do
  resources :property_images
  resources :amenities
  resources :property_features
  resources :addresses
  devise_for :admins
  root to: "properties#index"
  resources :properties
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
