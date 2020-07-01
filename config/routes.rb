Rails.application.routes.draw do
  # ログイン画面をroot設定
  devise_scope :user do
    root "users/sessions#new"
  end
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users
  resources :kindergartens
  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :show, :destroy, :update]
  end
  resources :application_documents
  resources :conversations do
    resources :messages
  end
  resources :archives
end
