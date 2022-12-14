Rails.application.routes.draw do
  get 'splashs/index'
  devise_for :users
  root 'groups#index'
  resources :users, only: :index do
    resources :groups, only: [:index, :new, :create, :destroy] do
      resources :entities, only: [:index, :new, :create, :destroy]
    end
  end
end
