Fuel::Engine.routes.draw do
  resources :posts

  get "/" => "posts#index", as: :blog_root

  namespace :admin do
    root to: 'posts#index'
    resources :posts
  end

end
