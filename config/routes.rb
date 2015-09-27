Rails.application.routes.draw do
  devise_for :users
  resources :home do
    post :get_tweets, on: :collection
  end
  root "home#index"
end
