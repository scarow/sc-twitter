Rails.application.routes.draw do
  get 'home/index'
  post 'home/get_tweets'
  root 'home#index'
end
