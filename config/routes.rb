Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: "pages#home"

  get "/profile", to: "pages#profile"
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :cars
  resources :notifications, only: [:index]
  resources :events, param: :invite_token do
    resources :rides, only: [:index, :create, :new] do
      collection do
        get :back
      end
    end
    resources :memberships, only: [:index, :new, :create ]
    resource :invite_link, only: [ :show ]
  end
  resources :rides, only: [:show] do
    resources :passenger_requests, only: [:create]
  end

  resources :passenger_requests, only: [:index, :edit, :update]

end
