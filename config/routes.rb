# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/create'
  resources :items
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: 'admin/dashboard#index'
  get '/home', to: redirect('http://localhost:3000/home')
  get '/auth_ss', to: 'authentication#auth_ss'
  post '/auth_ss', to: 'authentication#auth_ss'
  scope '/api' do
    post '/authenticate', to: 'authentication#authenticate'
    post '/users/sign_up', to: 'users#create'
  end

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
