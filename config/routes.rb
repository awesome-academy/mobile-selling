Rails.application.routes.draw do
  root to: "products#index"
  get "feedbacks/new"
  get "bill_details/new"
  get "bills/new"
  get "users/new"

  resources :products
  resources :catergories
end
