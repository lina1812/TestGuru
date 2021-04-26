Rails.application.routes.draw do
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  get 'sessions/new'
  get 'users/new'
  resources :answers
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  # GET /test_passeges/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
