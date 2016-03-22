Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :posts
  get 'search', :to => 'home#search'
  get 'search_result', :to => 'posts#search_result'

  resources :home
  get '/explore', :to => 'home#explore'

end
