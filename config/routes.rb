Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/dashboard', to: 'dashboard#show'

  get '/movies/discover', to: 'movies#discover'

  get '/movies', to: 'movies#index'
  get '/movies/:movie_id', to: 'movies#show'

  post '/friendships', to: 'friendships#create'

  get '/parties/new/:movie_id', to: 'parties#new'
  post '/parties', to: 'parties#create'

  post '/invitations', to: 'invitations#create'
end
