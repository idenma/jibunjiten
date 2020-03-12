Rails.application.routes.draw do
  #devise
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  #get '/sql', to: "posts#sql", as: 'sql'

  #search
  get "/posts/search",              to: "posts#search", as: 'search'
  get "/posts/search/:search/:id",  to: "posts#search_show", as: 'search_show'

  #home
  get "/",                         to: 'home#index' 
  root to: "home#index",            as: 'home'
  get '/posts/:dictionary_id/',     to: 'home#dictionaryshow'




  #dictionaries
  get "/posts/:dictionary_id/new",          to: "posts#new"
  get "/posts/:dictionary_id/:id/",         to: "home#show", as: 'posts_show'
	get "/posts/:dictionary_id/:id/edit",     to: "posts#edit"
  post "/posts/create",                     to: "posts#create"
  patch "/posts/:dictionary_id/:id/update", to: "posts#update"
  delete "/posts/:dictionary_id/:id",       to: "posts#destroy"


  #posts
 	get "/dictionaries",              to: "dictionaries#list"
  get "/dictionaries/new" ,         to: "dictionaries#new"
  post "/dictionaries/create",      to: "dictionaries#create"
  get  '/dictionaries/:id/edit',    to: "dictionaries#edit", as: 'dictionaries_edit'
  patch "/dictionaries/:id/update", to: "dictionaries#update", as: 'dictionaries_update'
	delete "/dictionaries/:id/",      to: "dictionaries#destroy"


end
