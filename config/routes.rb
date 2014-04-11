Fuel::Engine.routes.draw do
  resources :posts

  root to: 'posts#index'

  namespace :admin do
    root to: 'posts#index'
    resources :posts
  end

end
