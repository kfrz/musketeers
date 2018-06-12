# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  resources :gunslingers, only: %i[index show]
end
