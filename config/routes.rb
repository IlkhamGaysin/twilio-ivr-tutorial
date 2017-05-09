Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'twilio_ivrs#welcome'
  get '/menu', to: 'twilio_ivrs#menu'
  root to: 'pages#home'
end
