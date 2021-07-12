Rails.application.routes.draw do
  resources :address_geocodes
  resources :leads
  resources :elevators
  resources :columns
  resources :batteries
  resources :customers
  resources :addresses
  resources :building_details
  resources :buildings
  resources :quotes
	root "rocket#index"
  
	post "/home/testpost", to: "home#testpost"
	get "/index", to: "rocket#index"
	get "/quote", to: "rocket#quote"
	get "/residential", to: "rocket#residential"
	get "/commercial", to: "rocket#commercial"

	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	resources :employees
	get 'home/index'
	get 'home_controller/index'
	devise_for :users     

	post "/quotes/create", to: "quotes#create"

	post "/leads/create", to: "leads#create"

	get "/watson/refreshaudio", to: "watson#refreshaudio"
end