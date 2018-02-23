Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'welcome/index'

  resources :restaurants do
    resources :reviews
  end

  root 'welcome#index'
end
