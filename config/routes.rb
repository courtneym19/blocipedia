Rails.application.routes.draw do
  resources :private_wikis

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  resources :charges do
    get "downgrade"
  end

  devise_for :users

  root 'welcome#index'
end
