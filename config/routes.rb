Rails.application.routes.draw do
  #root "main#index"
  #get '/cities/create', to: redirect('/cities/view')
  get '/cities/view', to: 'cities#view'
  get '/cities/new', to: 'cities#new'
  post '/cities/view', to: 'cities#create'
  get '/cities/update', to: 'cities#update'
  get '/', to: redirect('/cities/view')
end
