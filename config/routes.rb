Rails.application.routes.draw do
  root to: 'applicants#index', defaults: { paginated: true }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :applicants
  resources :salary_distributions, only: [:index]
  get 'salary_distributions/download_pdf', to: 'salary_distributions#download_pdf'
  post '/calculate_inss', to: 'inss_calculations#calculate'
end
