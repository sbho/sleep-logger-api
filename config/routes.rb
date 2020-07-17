Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  get 'get_tips', to: 'get_tips#get_tips'
  get 'get_user', to: 'users#get_user'

  resources :users
  namespace :v1 do
    resources :morning_entries
    resources :evening_entries
    resources :tips
    get 'get_tips', to: 'get_tips#get_tips'
    post 'save_tip', to: 'tips#save_tip'
    post 'remove_tip', to: 'tips#remove_tip'
    get 'graphing', to: 'graphing#graphing'
    get 'm_entry_by_date', to: 'morning_entries#m_entry_by_date'
    get 'e_entry_by_date', to: 'evening_entries#e_entry_by_date'
  end
end