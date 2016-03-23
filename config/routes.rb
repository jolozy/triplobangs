Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
  end
  get 'search_result', :to => 'posts#search_result'

  resources :home
  get '/explore', :to => 'home#explore'
  get 'search', :to => 'home#search'

end
