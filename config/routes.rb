Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :proposals do
    resources :approval_flows, only: [:create, :new] do
      resources :steps, only: [:create, :edit, :new, :update] do
        resources :comments, only: [:create, :new]
      end
    end
  end
resources :steps, only: [:destroy]
get 'dashboard', to: 'pages#dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
