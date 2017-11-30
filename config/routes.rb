Rails.application.routes.draw do
  get 'csv_controller/import'

  get 'csv_controller/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
