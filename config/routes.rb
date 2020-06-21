Rails.application.routes.draw do
  devise_for :users
  resources :users
  # とりあえずのroot設定
  root 'kindergartens#index'
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
