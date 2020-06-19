Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
  namespace :v1 do
    resources :morning_entries
    resources :evening_entries
  end
end