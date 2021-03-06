Rails.application.routes.draw do

	resources :products do
  	resources :comments
	end
  
  devise_for :users
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'static_pages/about'

	get 'static_pages/contact'


	post 'static_pages/thank_you'
	post 'static_pages/contact'

	post 'payments/create'

	mount ActionCable.server => '/cable'

	get 'static_pages/landing_page'

  get 'static_pages/index'
  root 'static_pages#landing_page'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
