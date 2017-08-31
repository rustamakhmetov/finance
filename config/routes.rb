Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  namespace :api do
    namespace :v1 do
      resources :stocks, only: %i(index create update destroy)
    end
  end
end
