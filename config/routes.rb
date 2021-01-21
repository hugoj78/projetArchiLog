Rails.application.routes.draw do
	devise_for :users
	get '/', to: 'mangas#index'
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	resources :mangas do
    	resources :tomes, only: [:new, :create, :show]
  		end
  	resources :tomes do
  		resources :reviews, only: [:new, :create, :show, :edit, :delete]
  		end

	resource :reviews
end