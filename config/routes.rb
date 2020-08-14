Rails.application.routes.draw do
  # トップ画面(root設定)
  root 'homes#top'
  resources :homes, only: [:top]
  # ゲストログイン設定
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
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
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
