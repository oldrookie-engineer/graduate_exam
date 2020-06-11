Rails.application.routes.draw do
  # とりあえずのroot設定
  root :to => 'kindergartens#index'
  resources :kindergartens
end
