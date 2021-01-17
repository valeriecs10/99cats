Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resources :cat_rental_requests, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  get 'cat_rental_requests/:id/approve', to: 'cat_rental_requests#approve'
  get 'cat_rental_requests/:id/deny', to: 'cat_rental_requests#deny' 
end
