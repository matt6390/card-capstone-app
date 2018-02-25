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
  post '/user_cards' => 'user_cards#create'
  delete '/user_cards/:id' => 'user_cards#destroy'

  get '/prices' => 'prices#index'
  post '/prices' => 'prices#create'

  get '/comments' => 'comments#index'
  get '/comments/:id' => 'comments#show'
  post '/comments' => 'comments#create'

end
