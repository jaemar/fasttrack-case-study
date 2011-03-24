FasttrackCaseStudy::Application.routes.draw do

  get "photos/index"

  get "shares/index"

  resources :albums do
    resource :photos
  end

  root :to => "home#index"

  devise_for :users

  match "albums/:id/enable" => "albums#enable", :via => :get, :as => 'enable'
  match "albums/:id/disable" => "albums#disable", :via => :get, :as => 'disable'

  match "home/search" => "home#search", :via => :get, :as => "search"
end
