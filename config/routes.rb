Rails.application.routes.draw do



  resources :auctions do
    resources :bids
    resources :watches, only: [:create, :destroy]
  end

  resources :users, only: [:create, :new] do
    get 'watched_auctions', to: 'auctions#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end
end
