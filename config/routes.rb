# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :soy_beans, action: :index
  resources :soy_beans, only: %i[index create]
end
