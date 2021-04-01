Rails.application.routes.draw do

  root 'tests#index'
  
  resources :tests do
    resources :questions
  end
  
  get 'tests/:category/:title', to: 'tests#search'
end
