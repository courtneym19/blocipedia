Rails.application.routes.draw do
  get 'private_wikis/index'

  get 'private_wikis/show'

  get 'private_wikis/new'

  get 'private_wikis/edit'

  resources :wikis

  resources :charges

  devise_for :users

  root 'welcome#index'
end
