Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: "pages#home"
  get "/profile", to: "pages#profile"
  resources :cars
  resources :chatrooms, only: [:show, :index, :edit, :update] do
    resources :messages, only: :create
  end
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
