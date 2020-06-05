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
  get "/posts/:dictionary_id/new",          to: "posts#new",as: 'posts_new'
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

  #ここにmicropostを置きたい
  #postに続く数字や要素が入る
  #必要なのはnew,create,edit,update,destroy

  # get "/micropost/:dictionary_id/:post_id/new" ,         to: "micropost#new",    as: 'microposts_new'
  # post "/micropost/:dictionary_id/:post_id/create",      to: "micropost#create", as: 'microposts_create'
  # get  '/micropost/:dictionary_id/:post_id/:id/,         to: "micropost#edit",   as: 'microposts_edit'
  # patch "/micropost/:dictionary_id/:post_id/:id/,        to: "micropost#update", as: 'microposts_update'
  # delete "/micropost/:dictionary_id/:post_id/:id/",      to: "micropost#destroy" as: 'microposts_destroy'


end
