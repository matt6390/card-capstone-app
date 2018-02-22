Rails.application.routes.draw do
  get "/cards" => 'cards#index'
  get "/cards/:id" => 'cards#show'
  post "/cards" => 'cards#create'
  patch "/cards/:id" => 'cards#update'
  delete "cards/:id" => 'cards#destroy'
 
  post 'user_token' => 'user_token#create'
  post "/user_token" => 'user_token#create'
  post "/users" => 'users#create'
  delete "/users" => 'users#destroy'

  get '/user_cards' => 'user_cards#index'
  post '/user_cards' => 'user_cards#create'

end
