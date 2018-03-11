Rails.application.routes.draw do
  get "/cards" => 'cards#index'
  get "/cards/:id" => 'cards#show'
  post "/cards" => 'cards#create'
  patch "/cards/:id" => 'cards#update'
  delete "cards/:id" => 'cards#destroy'
 
  post 'user_token' => 'user_token#create'
  post "/user_token" => 'user_token#create'

  get "/users/:id" => 'users#show'
  post "/users" => 'users#create'
  patch "/users/:id" => 'users#update'
  delete "/users/:id" => 'users#destroy'

  get '/user_cards' => 'user_cards#index'
  get '/user_cards/:id' => 'user_cards#show'
  post '/user_cards' => 'user_cards#create'
  patch '/user_cards' => 'user_cards#update'
  delete '/user_cards/:id' => 'user_cards#destroy'

  get '/prices' => 'prices#index'
  post '/prices' => 'prices#create'

  get '/comments' => 'comments#index'
  get '/comments/:id' => 'comments#show'
  post '/comments' => 'comments#create'

  get '/decks' => 'decks#index'
  get '/decks/:id' => 'decks#show'
  post '/decks' => 'decks#create'
  patch '/decks/:id' => 'decks#update'
  delete 'decks/:id' => 'decks#destroy'

  get '/deck_cards' => 'deck_cards#index'
  get '/deck_cards/:id' => 'deck_cards#show'
  post '/deck_cards' => 'deck_cards#create'
  patch '/deck_cards/:id' => 'deck_cards#update'
  delete '/deck_cards/:id' => 'deck_cards#destroy'


end
