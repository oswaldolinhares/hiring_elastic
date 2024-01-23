Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :applicants
  post '/calculate_inss', to: 'inss_calculations#calculate'
end
