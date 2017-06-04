Rails.application.routes.draw do


  resources :collections do
    resources :questions do
      member do
        post :join
        post :quit
      end
    end
    resources :answers do
      member do
        get :new
        post :saveAnswer
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


  devise_for :users

  root 'welcome#index'
end
