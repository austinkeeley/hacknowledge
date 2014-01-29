Hacknowledge::Application.routes.draw do
  resources :sponsors

  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}
  
  resources :authentications
  resources :users
  resources :teams
  resources :participants
  resources :events

  root 'pages#index'

  get '/eventbrite/:eventbrite_event_id', :to => 'events#eventbrite'

end
