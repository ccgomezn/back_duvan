Rails.application.routes.draw do
  get 'page/index'
  root 'page#index'

  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
