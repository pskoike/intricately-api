# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :dns_records, only: %i[index create]
    end
  end
end
