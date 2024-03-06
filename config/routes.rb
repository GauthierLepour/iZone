Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars
  resources :events do
    resources :rides, only: [:index, :create, :new]
  end
end
