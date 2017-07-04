Rails.application.routes.draw do



  resources :auctions do
    resources :bids
  end

  resources :users, only: [:create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end
end
