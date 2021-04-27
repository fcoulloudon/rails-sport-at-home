Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resource :rents

  resource :equipments

  # resources :brands, only: [:index, :show] do
  #  resources :products, only: [:index, :show]
  # end

end
