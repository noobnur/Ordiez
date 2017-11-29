Rails.application.routes.draw do
get '/orders', to: 'orders#index'
get 'orders/:order_id', to: 'orders#show'

get '/orders/:order_id/feedbacks', to: 'orders#feedback'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
