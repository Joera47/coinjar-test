Rails.application.routes.draw do
	root "prices#index"
	resources :prices
end