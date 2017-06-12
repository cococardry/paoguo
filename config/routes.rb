Rails.application.routes.draw do
# namespace :admin do
  resources :collections do
    resources :questions do
      collection do
        get :input
        post :update_temp
      end
      member do
        post :join
        post :quit
      end
    end
    resources :answers do
      member do
        get :new
        post :updateAnswer
      end
    end
    member do
      post :join
    end
  end

  resources :questions do
    member do
      post :join
    end
  end

  resources :answers
# end
  devise_for :users
  root 'welcome#index'
end
