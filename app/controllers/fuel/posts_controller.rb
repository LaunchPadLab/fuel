require_dependency "fuel/application_controller"

module Fuel
  class PostsController < ApplicationController
    include ActionView::Helpers::TextHelper
    layout Fuel.configuration.layout if Fuel.configuration.layout
    before_filter :define_title

    def define_title
      @blog_title = Fuel.configuration.blog_title
    end

    def index
      @posts = Fuel::Post.where(published: true).order("created_at DESC").page(params[:page])
    end

    def show
      # delete || Fuel::Post.find_by_id(params[:id]) once done testing pagination
      @post = Fuel::Post.find_by_slug(params[:id]) || Fuel::Post.find_by_id(params[:id])
      @title = truncate_on_space(@post.title, 70)
      @disqus_name = Fuel.configuration.disqus_name
    end

    private

      def truncate_on_space(text, length)
        truncate(text, length: length, separator: ' ')
      end
  end
end
