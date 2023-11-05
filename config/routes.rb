Rails.application.routes.draw do
  get 'lists/index', to: 'lists#index'
  resources :lists
end
