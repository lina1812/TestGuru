Rails.application.routes.draw do
  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }

  get 'sessions/new'
  get 'users/new'

  root 'tests#index'

  resources :gists, only: :create

  resource :feedback, only: %i[new create]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # GET /test_passeges/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: :index
  end
end
