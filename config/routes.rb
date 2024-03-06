Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: "pages#home"
  resources :cars
  resources :events, param: :invite_token do
    resources :rides, only: [:index, :create, :new]
    resources :memberships, only: [:new, :create ]
    resource :invite_link, only: [ :show ]
  end
  resources :rides, only: [:show]
end
