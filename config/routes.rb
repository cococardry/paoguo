Rails.application.routes.draw do
# namespace :admin do
  resources :collections
  resources :questions
# end
  devise_for :users
  root 'welcome#index'
end
