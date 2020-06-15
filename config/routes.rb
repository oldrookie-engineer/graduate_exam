Rails.application.routes.draw do
  devise_for :users
  # とりあえずのroot設定
  root 'kindergartens#index'
  resources :kindergartens
  namespace :api, format: 'json' do
    resources :tasks, only:%i(index create show update destroy)
  end
end
