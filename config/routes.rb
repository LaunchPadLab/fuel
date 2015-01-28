Fuel::Engine.routes.draw do
  namespace :admin do
    root to: 'fuel_posts#index'
    get "fuel_posts/preview" => 'fuel_posts#preview'
    get "fuel_posts/:slug/preview" => 'fuel_posts#preview'
    resources :fuel_posts do
      member do
        get 'content'
      end
    end
  end

  resources :fuel_posts, :path => ''
  get '/fuel_posts/:id' => 'fuel_posts#redirect'
  get "/" => 'fuel_posts#index', as: :blog_root

end