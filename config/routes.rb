Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'welcome/index'

  authenticated :user do
      root 'welcome#index', as: 'authenticated_root'
    end
    devise_scope :user do
      root 'devise/sessions#new'
    end
  resources :authentications, only: [:destroy]
  resources :restaurants do
    resources :reviews
  end


end
