Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/contact', to: 'root#contact'
  get '/about', to: 'root#about'
  get '/response', to: 'root#api'
  get '/user/:id/:name', to: "root#user"
  post '/add', to: "root#add"
  delete '/delete/:id', to: "root#delete"
  get '/update/:id', to: "root#update"
  get "/search", to:"root#search"
  post '/updateform', to: "root#updateform"
  root "root#index"
end
