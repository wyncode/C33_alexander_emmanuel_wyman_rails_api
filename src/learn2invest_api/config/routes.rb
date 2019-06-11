Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
  post 'authenticate', to: 'authentication#authenticate'
  resources :customers, only: [:index, :show, :create, :update, :destroy]

  # get 'customers/:id/cashaccount',to: 'customers#getCashAccount'
  # get 'customers/:id/stocks',to: 'customers#getStocks'
  # get 'customers/'

end
