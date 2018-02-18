Rails.application.routes.draw do
  get "/cards" => 'cards#index'
  get "/cards/:id" => 'cards#show'
  post "/cards" => 'cards#create'
  patch "/card/:id" => 'cards#update'
end
