Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :book
      resources :preinfo
      resources :section
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
