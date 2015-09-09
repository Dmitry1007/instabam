Rails.application.routes.draw do
  get "/auth/instagram/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root "home#show"
end
