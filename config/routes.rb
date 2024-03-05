Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars
  resources :events, param: :invite_token do
    resources :rides, only: [:create, :new]
    resources :memberships, only: [ :new, :create ]
    resource :invite_link, only: [ :show ]
  end
end
