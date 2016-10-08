Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:index, :destroy]
  resources :posts

  root to: 'subs#index'
end
