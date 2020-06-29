# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rfis
  resources :teams
  get 'users/create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: 'admin/dashboard#index'
  scope '/api' do
    resources :items
    resources :projects
    post 'authenticate', to: 'authentication#authenticate'
    post 'users/sign_up', to: 'users#create'
  end

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
