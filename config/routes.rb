Rails.application.routes.draw do
  root "products#new"
  get "/feedbacks" to: "feedbacks#new"
  get "/catergories" to: "catergories#new"
  get "/bill_details" to: "bill_details#new"
  get "/bill" to: "bills#new"
  get "/users" to: "users#new"
end
