class FuelPostsController < ApplicationController
  include ActionView::Helpers::TextHelper
  layout Fuel.configuration.layout if Fuel.configuration.layout
  before_filter :define_title

  def define_title
    @blog_title = Fuel.configuration.blog_title
  end

  def index
    @posts = FuelPost.recent_published_posts.page(params[:page])
  end

  def show
    # delete || Post.find_by_id(params[:id]) once done testing pagination
    @post = FuelPost.find_by_slug(params[:id]) || FuelPost.find_by_id(params[:id])
    @title = truncate_on_space(@post.title, 70)
    @disqus_name = Fuel.configuration.disqus_name
  end

  def preview
    @content = params[:content]
    respond_to do |format|
      format.js
    end
  end

  def redirect
    post = FuelPost.find_by_slug(params[:id]) || FuelPost.find_by_id(params[:id])
    return redirect_to post
  end

  private

    def truncate_on_space(text, length)
      truncate(text, length: length, separator: ' ')
    end

end
