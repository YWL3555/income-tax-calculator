Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tax_records, only: [:index]
  post '/monthly_payslip', to: 'employees#monthly_payslip'

end
