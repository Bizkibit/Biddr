Rails.application.routes.draw do
  get 'bids/create'

  # get 'auctions/create'
  #
  # get 'auctions/new'
  #
  # get 'auctions/show'
  #
  # get 'auctions/index'

  resources :auctions do
    resources :bids
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
