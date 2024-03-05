Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events do
    resources :rides, only: :create
  end
end
