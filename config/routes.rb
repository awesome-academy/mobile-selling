Rails.application.routes.draw do
  root to: 'home_page#index'
  get "products/index"
  get "feedbacks/new"
  get "bill_details/new"
  get "bills/new"
  get "users/new"

  resources :line_items
  resources :products
  resources :catergories
  resources :bill_details
  resources :carts
end
