Rails.application.routes.draw do

  resources :entities, :except => [:index, :show]

  resources :tags, :only => [:show]
  resources :collections, :only => [:show]
  scope '/admin' do
    resources :tags, :except => [:show]
    resources :collections, :except => [:show]
    resources :relations, :except => [:show]
    resources :locations
  end

  get 'animes/(:letter)', to: 'entities#index', as: 'animes', :type => 1
  get 'anime/:id', to: 'entities#show', as: 'anime'

  get 'movies/(:letter)', to: 'entities#index', as: 'movies', :type => 2
  get 'movie/:id', to: 'entities#show', as: 'movie'

  get 'books/(:letter)', to: 'entities#index', as: 'books', :type => 3
  get 'book/:id', to: 'entities#show', as: 'book'

  get 'search/', to: 'entities#search', as: 'search'
  get 'search/suggests', to: 'entities#search_suggests', as: 'search_suggests', format: 'json'

  root 'pages#home'
end
