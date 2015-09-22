Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  post "home/get_tweets"
  get "home/get_tweets", to: "home#index", as: "home"
  root "home#index"
end
