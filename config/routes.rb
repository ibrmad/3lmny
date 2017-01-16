Rails.application.routes.draw do
  resource :users, only: [:edit] do
    member do
      get ':id/edit_password', to: 'users#edit_password', as: 'edit_password'
      patch ':id/update_password', to: 'users#update_password', as: 'update_password'
    end
  end
  resources :admin
  resources :searches
  resources :announcements
  resources :videos do
    resources :comments
  end
  resources :majors
  resources :faculties
  resources :documents do
    member do
      get :approve
    end
  end
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  resources :posts do
    resources :comments
    member do
      patch 'upvote', to: 'posts#upvote'
      patch 'downvote', to: 'posts#downvote'
    end
  end
  resources :courses do
    member do
      get 'posts', to: 'courses#posts'
      get 'documents', to: 'courses#documents'
      get 'videos', to: 'courses#videos'
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
  }
  devise_scope :user do
    match 'users/:id', to: 'users#destroy', via: :delete, as: :admin_delete_user
    get 'users/:username', to: 'users/sessions#profile', as: 'user_profile'
    get 'users/:id/edit', to: 'users/registrations#edit', as: 'edit_user_profile'
    get 'users', to: 'users/registrations#index', as: 'users'
    get 'login', to: 'users/sessions#new', as: 'login'
    get 'register', to: 'users/registrations#new', as: 'register'
  end

  authenticated :user do
    root to: "posts#index"
    # Rails 4 users must specify the 'as' option to give it a unique name
    # root :to => "main#dashboard", :as => "authenticated_root"
  end

  root to: "static_pages#index"
end
