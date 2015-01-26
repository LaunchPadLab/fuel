module Fuel
  class Admin::PostsController < ApplicationController
    http_basic_authenticate_with name: Fuel.configuration.username, password: Fuel.configuration.password
    layout "fuel/application"

    def index
      @posts = Fuel::Post.order("created_at DESC")
    end

    def new
      @post = Fuel::Post.new
    end

    def create
      if Rails.version[0].to_i < 4
        @post = Fuel::Post.new(params[:post])
      else
        @post = Fuel::Post.new(post_params)
      end
      update_published

      if @post.save
        redirect_to admin_posts_path, notice: "Your blog post was successfully #{@message}."
      else
        render action: "new"
      end
    end

    def edit
      @post = Fuel::Post.find_by_slug(params[:id])
    end

    def update
      @post = Fuel::Post.find_by_slug(params[:id])
      if Rails.version[0].to_i < 4
        @post.attributes = params[:post]
      else
        @post.attributes = post_params
      end
      update_published

      if @post.save
        redirect_to admin_posts_path, notice: "Post was updated and #{@message}"
      else
        render action: "edit"
      end
    end

    def destroy
      @post = Fuel::Post.find_by_slug(params[:id])
      @post.destroy
      redirect_to admin_posts_path, notice: "Post was successfully deleted"
    end

    def preview
      @content = params[:post][:content]
      respond_to do |format|
        format.js
      end
    end

    private

      def post_params
        params.require(:post).permit(:tag, :author, :content, :title, :featured_image_url, :teaser, :featured_image)
      end

      def update_published
        @post.published = params[:commit] == "Save Draft" ? false : true
        @message = @post.published ? "posted" : "saved"
      end

  end
end
