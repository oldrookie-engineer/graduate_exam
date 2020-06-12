Rails.application.routes.draw do
  devise_for :users
  # とりあえずのroot設定
  root 'kindergartens#index'
  resources :kindergartens
end
