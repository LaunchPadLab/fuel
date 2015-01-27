Fuel::Engine.routes.draw do
  namespace :admin do
    root to: 'posts#index'
    get "posts/preview" => 'posts#preview'
    get "posts/:slug/preview" => 'posts#preview'
    resources :posts do
      member do
        get 'content'
      end
    end
  end

  resources :posts, :path => '', controller: "Fuel::Posts"
  get '/posts/:id', controller: "Fuel::Posts", action: "redirect"
  get "/", controller: "Fuel::Posts", action: "index", as: :blog_root

end