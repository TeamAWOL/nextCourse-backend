Rails.application.routes.draw do

  resources :tog_events, defaults: {format: :json}
  resources :users, defaults: {format: :json}
  post 'login_token' => 'user_token#login'

end
