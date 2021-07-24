Rails.application.routes.draw do
  resources :interventions
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

	post "/admin/intervention.html.erb", to: "interventions#create"

	get "/watson/refreshaudio", to: "watson#refreshaudio"

	get '/get_building_by_customer/:customer_id', to: 'customers#get_buildings_by_customers'  

	get '/get_battery_by_building/:building_id', to: 'buildings#get_batteries_by_buildings' 

	get '/get_column_by_battery/:battery_id', to: 'batteries#get_columns_by_batteries'  

	get '/get_elevator_by_column/:column_id', to: 'columns#get_elevators_by_columns'
end