Rails.application.routes.draw do


  namespace :admin do
    resources :users
    resources :announcements
    resources :comments
    resources :courses
    resources :documents
    resources :faculties
    resources :majors
    resources :posts
    resources :videos

    root to: "posts#index"
  end

  resources :searches
  resources :announcements
  resources :videos
  resources :posts do
    resources :comments
    member do
      patch 'upvote', to: 'posts#upvote'
      patch 'downvote', to: 'posts#downvote'
    end
  end

  resources :comments do
    resources :comments
  end
  resources :courses do
    member do
      get 'posts', to: 'courses#posts'
      get 'documents', to: 'courses#documents'
      get 'videos', to: 'courses#videos'
    end
  end
  resources :majors
  resources :faculties
  resources :documents

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:username', to: 'users/sessions#profile', as: 'user_profile'
    get 'users/:id/edit', to: 'users/registrations#edit', as: 'edit_user'
    get 'login', to: 'users/sessions#new', as: 'login'
    get 'register', to: 'users/registrations#new', as: 'register'
  end
  root to: "posts#index"
end
