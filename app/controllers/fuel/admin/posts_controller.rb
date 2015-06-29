module Fuel
  module Admin
    class PostsController < AdminController
      layout "fuel/application"
      before_filter :find_posts
      before_filter :find_post, only: [:edit, :update, :destroy]
      before_filter :set_url, only: [:new, :create, :edit, :update]

      def index
      end

      def new
        @post = Fuel::Post.new
      end

      def create
        @params_hash = Rails.version[0].to_i < 4 ? params[:fuel_post] : post_params
        update_published_at
        @post = Fuel::Post.new(@params_hash)
        set_message

        if @post.save
          redirect_to fuel.admin_posts_path, notice: "Your blog post was successfully #{@message}."
        else
          render action: "new"
        end
      end

      def edit

      end

      def update
        @params_hash = Rails.version[0].to_i < 4 ? params[:fuel_post] : post_params
        update_published_at
        @post.attributes = @params_hash
        set_message

        if @post.save
          redirect_to fuel.edit_admin_post_path(@post), notice: "Post was updated and #{@message}"
        else
          render "edit"
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

      def upload_image
        raise params.inspect
      end

      private

        def post_params
          params.require(:fuel_post).permit(:tag, :author_id, :content, :title, :teaser, :featured_image, :published, :published_at)
        end

        def update_published_at
          published_at_string = @params_hash[:published_at]
          published_at_datetime = DateTime.strptime(published_at_string, "%m/%d/%Y")
          @params_hash[:published_at] = published_at_datetime
        end

        def set_message
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