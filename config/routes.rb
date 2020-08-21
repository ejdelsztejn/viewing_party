Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/dashboard', to: 'dashboard#show'

  get '/movies', to: 'movies#index'
  get '/movies/search', to: 'movies#search'

  post '/friendships', to: 'friendships#create'
end
