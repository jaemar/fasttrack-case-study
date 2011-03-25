FasttrackCaseStudy::Application.routes.draw do

  get "invitations/index"

  get "photos/index"

  resources :albums do
    resource :photos
    resource :shares
  end

  root :to => "home#index"

  devise_for :users

  match "albums/:id/enable" => "albums#enable", :via => :get, :as => 'enable'
  match "albums/:id/delete" => "albums#delete", :via => :get, :as => 'delete'

  match 'photo/:id' => 'photos#move', :via => :put, :as => 'update_move_photo'
  match 'photo/:id/move' => 'photos#index', :via => :get, :as => 'move_photo'

  match "home/search" => "home#search", :via => :get, :as => "search"

  match "invitations/:id" => "invitations#invite", :via => :post, :as => "invite"

  match "admin" => "administrators#index", :via => :get
  match "admin/:id/blocked_user" => "administrators#show", :via => :get, :as => 'blocked_user'
end
