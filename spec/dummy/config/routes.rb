Rails.application.routes.draw do

  mount Fuel::Engine => '/blog'
  resources :users

end
