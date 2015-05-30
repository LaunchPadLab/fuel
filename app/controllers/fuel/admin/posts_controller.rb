module Fuel
  module Admin
    class PostsController < FuelController
      layout "fuel/application"
      before_filter :find_posts
      before_filter :find_post, only: [:edit, :update, :destroy]
      before_filter :set_url, only: [:new, :create, :edit, :update]

      def index
        @post = @posts.first
        set_url
      end

      def new
        @post = Fuel::Post.new
      end

      def create
        if Rails.version[0].to_i < 4
          @post = Fuel::Post.new(params[:fuel_post])
        else
          @post = Fuel::Post.new(post_params)
        end
        update_published

        if @post.save
          redirect_to fuel.admin_posts_path, notice: "Your blog post was successfully #{@message}."
        else
          render action: "new"
        end
      end

      def edit

      end

      def update
        if Rails.version[0].to_i < 4
          @post.attributes = params[:fuel_post]
        else
          @post.attributes = post_params
        end
        update_published

        if @post.save
          redirect_to fuel.admin_posts_path, notice: "Post was updated and #{@message}"
        else
          render action: "edit"
        end
      end

      def destroy
        @post.destroy
        redirect_to fuel.admin_posts_path, notice: "Post was successfully deleted"
      end

      def preview
        @content = params[:fuel_post][:content]
        respond_to do |format|
          format.js
        end
      end

      def show
      end

      private

        def post_params
          params.require(:fuel_post).permit(:tag, :author_id, :content, :title, :teaser, :featured_image, :posted_at)
        end

        def update_published
          @post.published = params[:commit] == "Save Draft" ? false : true
          @message = @post.published ? "posted" : "saved"
        end

        def find_post
          @post = Fuel::Post.find_by_slug(params[:id])
        end

        def find_posts
          @posts = Fuel::Post.order("created_at DESC")
        end

        def set_url
          @url = ["new", "create"].include?(action_name) ? fuel.admin_posts_path : fuel.admin_post_path(@post)
        end

    end
  end
end