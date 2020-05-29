# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: 'admin/dashboard#index'
  post 'authenticate', to: 'authentication#authenticate'
  scope '/api' do
  end

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
