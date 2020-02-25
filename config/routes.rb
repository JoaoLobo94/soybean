# frozen_string_literal: true

Rails.application.routes.draw do
  resources :soy_beans, only: %i[index create]
end
