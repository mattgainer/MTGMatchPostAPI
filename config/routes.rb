Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :sessions
    resources :users
    resources :formats
    resources :decks
    resources :matches
    resources :deckbrew
    resources :results
  end
end
