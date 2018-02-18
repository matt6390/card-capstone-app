Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get "/cards" => 'cards#index'
  get "/cards/:id" => 'cards#show'
  post "/cards" => 'cards#create'
  patch "/cards/:id" => 'cards#update'
  delete "cards/:id" => 'cards#destroy'

  post "/user_token" => 'user_token#create'
  post "/users" => 'users#create'
  delete "/users" => 'users#destroy'
end
