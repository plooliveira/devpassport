Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :tests

  get     '/company_dashboard/',  to: "dashboard#company"
  get     '/user_dashboard/',     to: "dashboard#user"

  get     '/visas/',              to: "visas#index"
  get     '/visas/:id',           to: "visas#show",           as: "visa"
  get     '/stamps/',             to: "stamps#index"
  post    '/stamps/',             to: "stamps#create",        as: "stamp_create"
  get     '/stamps/:id/payment',  to: "stamps#payment",       as: "payment"
  post    '/stamps/:id/',         to: "stamps#check_payment", as: "check_payment"
  get     '/stamps/:id/',         to: "stamps#show",          as: "stamp"


end
