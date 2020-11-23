Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "sessions#create"
  end

  resources :basic_words
  resources :categories
  resources :words
end