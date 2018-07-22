Rails.application.routes.draw do
  root 'admin#index'
  devise_for :users
	resources :admin, only: [:index]
	namespace :admin do
		resources :users
		resources :clients
		resources :products
	end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
