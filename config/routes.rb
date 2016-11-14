Rails.application.routes.draw do
  resources :posts
  resources :discusses
  resources :courses
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
