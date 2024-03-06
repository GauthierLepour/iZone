Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars
  resources :events do
    resources :rides, only: [:create, :new]
  end
  resources :rides, only: [:show]
end
