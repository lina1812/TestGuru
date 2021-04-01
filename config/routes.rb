Rails.application.routes.draw do

  root 'tests#index'
  
  resources :tests
  
  get 'tests/:category/:title', to: 'tests#search'
end
