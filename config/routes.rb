Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  get 'get_tips', to: 'get_tips#get_tips'

  resources :users
  namespace :v1 do
    resources :morning_entries
    resources :evening_entries
    resources :tips
    get 'get_tips', to: 'get_tips#get_tips'
    post 'save_tip', to: 'tips#save_tip'
    post 'remove_tip', to: 'tips#remove_tip'
  end
end