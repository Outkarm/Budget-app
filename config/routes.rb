# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root 'welcome#index', as: :unauthenticated_root
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :trade_records
  end
end
