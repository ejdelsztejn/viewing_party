Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/dashboard', to: 'dashboard#show'

  get '/movies/discover', to: 'movies#discover'

  get '/movies', to: 'movies#index'
  # get '/movies/top_rated', to: 'movies#top_rated'

  post '/friendships', to: 'friendships#create'
end
