Rails.application.routes.draw do
  post "/schedule", to: "schedules#new"
  get "/schedules", to: "schedules#index"
  get "/schedule/:id", to: "schedules#show"
  delete "/schedule/:id", to: "schedules#destroy"

  post "/schedule/:schedule_id/appointment", to: "appointments#new"
  get "/appointment/:appointment_id", to: "appointments#show"
  delete "/schedule/:schedule_id/appointment/:appointment_id", to: "appointments#destroy"
  get "/schedule/:schedule_id/appointments", to: "appointments#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
