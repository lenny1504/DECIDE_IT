Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :proposals do
    patch 'approve', to: 'proposals#approve'
    resources :approval_flows, only: [:create, :new] do
      resources :steps, only: [:create, :edit, :new, :update] do
        resources :comments, only: [:create, :new]
      end
    end
  end
  resources :approval_flows, only: :show
  resources :steps, only: [:destroy] do
    patch 'approve', to: 'steps#approve'
    patch 'reject', to: 'steps#reject'
    patch 'request_change', to: 'steps#request_change'
    patch 'new_review', to: 'steps#new_review'
    patch 'start', to: 'steps#start'
  end
  get 'dashboard', to: 'pages#dashboard'
  get '/user' => "pages#dashboard", :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
