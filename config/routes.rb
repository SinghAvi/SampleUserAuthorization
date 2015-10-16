# == Route Map
#
#       Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            welcome#index
#     sessions GET    /sessions(.:format)          sessions#index
#              POST   /sessions(.:format)          sessions#create
#  new_session GET    /sessions/new(.:format)      sessions#new
# edit_session GET    /sessions/:id/edit(.:format) sessions#edit
#      session GET    /sessions/:id(.:format)      sessions#show
#              PATCH  /sessions/:id(.:format)      sessions#update
#              PUT    /sessions/:id(.:format)      sessions#update
#              DELETE /sessions/:id(.:format)      sessions#destroy
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#              POST   /logout/:id(.:format)        users#logout
#        login GET    /users/:id(.:format)         users#login_attempt
#         page GET    /pages/*id                   high_voltage/pages#show
#

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :sessions

  # resources :users
  post '/users/:id', to: 'users#create', as: 'create'

  get '/logout', :to => "users#logout", as: 'logout'

  get '/users', to: 'users#login_attempt', as: 'login'

  get '/users/:id', to: 'users#show', as: 'show'
  get '/users/:id', to: 'users#index', as: 'index'

end
