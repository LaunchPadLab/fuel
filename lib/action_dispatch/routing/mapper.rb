puts "In mapper.rb"
module ActionDispatch::Routing
  class Mapper
    def mount_my_engine_at(mount_location)
      scope mount_location do
        #Declare all your routes here
        resources :posts, :path => ''
        get '/posts/:id' => 'posts#redirect'
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
    end
  end
end
