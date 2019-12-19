Rails.application.routes.draw do
  root "prices#latest"

  resources :prices, only: [:index, :create] do
    collection do
      get "latest"
    end
  end
end