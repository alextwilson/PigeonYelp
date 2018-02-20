Rails.application.routes.draw do
  get 'welcome/index'

  resources :restaurants do
    resources :reviews
  end

  root 'welcome#index'
end
