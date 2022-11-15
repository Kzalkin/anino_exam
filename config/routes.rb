Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[create show]
  resources :leaderboard, only: %i[show] do
    resources :user, only: %i[update] do 
      put 'add_score', to: 'leaderboard#add_score'
      patch 'add_score', to: 'leaderboard#add_score'
    end
  end

  namespace :admin do
    resources :leaderboard, only: :create
  end
end
