Rails.application.routes.draw do
  devise_for :users, path_name: { 
    sign_in: 'login', sign_out: 'logout'
  }
  get "up" => "rails/health#show", as: :rails_health_check
  resources :journal_entries
  root to: "journal_entries#index"
end
