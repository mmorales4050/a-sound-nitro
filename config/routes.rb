Rails.application.routes.draw do
  resources :audiobooks
  resources :users
  resources :playlists
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
