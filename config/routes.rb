Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "equipments" => "equipments#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resource :rents
  # resource :users

  # resources :equipments, only: []

  # pour tout le monde, mais en particulier les "users"
  resources :equipments, only: [ :index, :show, :update, :edit ]

  resources :equipments, only: [] do
    resources :rents, only: [ :new, :create ]
  end

  resources :users, only: [] do
    resources :rents , only: [ :index, :show, :destroy, :update, :edit ]
    # pour les owners
    resources :equipments, only: [:new, :create, :index, :show, :destroy, :update, :edit]
  end

  # resources :brands, only: [:index, :show] do
  #  resources :products, only: [:index, :show]
  # end

end
