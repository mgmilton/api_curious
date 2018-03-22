Rails.application.routes.draw do
  root "home#index"
  get '/show', to: "home#show"
  get "/auth/github", :as => :github_login
  get "/auth/github/callback", to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
