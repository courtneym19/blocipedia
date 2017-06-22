Rails.application.routes.draw do
  resources :private_wikis

  resources :wikis

  resources :charges do
    get "downgrade"
  end

  devise_for :users, controllers: { charges: 'charges' }

  root 'welcome#index'
end
