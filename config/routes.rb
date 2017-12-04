Rails.application.routes.draw do
  get 'csv_controller/import'

  get 'csv_controller/show'

	root 'csv_controller#import'

	resources 'stocks', only: :import do
		collection { post :import }
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
