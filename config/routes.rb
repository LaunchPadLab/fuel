Fuel::Engine.routes.draw do
  resources :posts, :path => ''

  get "/" => "posts#index", as: :blog_root

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

end
