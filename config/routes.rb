Rails.application.routes.draw do
  get 'overview', to: 'overview#home', as: 'overview'

  get 'revenue/commissions'

  resources :vehicles
  resources :clients
  resources :policies
  resources :insurers

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'overview#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
