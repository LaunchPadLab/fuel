class Admin::FuelPostsController < ApplicationController
  http_basic_authenticate_with name: Fuel.configuration.username, password: Fuel.configuration.password
  layout "fuel/application"
  before_filter :find_post, only: [:edit, :update, :destroy]
  before_filter :set_url, only: [:new, :create, :edit, :update]

  def index
    @posts = FuelPost.order("created_at DESC")
  end

  def new
    @post = FuelPost.new
  end

  def create
    if Rails.version[0].to_i < 4
      @post = FuelPost.new(params[:fuel_post])
    else
      @post = FuelPost.new(post_params)
    end
    update_published

    if @post.save
      redirect_to fuel_engine.admin_fuel_posts_path, notice: "Your blog post was successfully #{@message}."
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
      redirect_to fuel_engine.admin_fuel_posts_path, notice: "Post was updated and #{@message}"
    else
      render action: "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to fuel_engine.admin_fuel_posts_path, notice: "Post was successfully deleted"
  end

  def preview
    @content = params[:fuel_post][:content]
    respond_to do |format|
      format.js
    end
  end

  private

    def post_params
      params.require(:fuel_post).permit(:tag, :author, :content, :title, :featured_image_url, :teaser, :featured_image)
    end

    def update_published
      @post.published = params[:commit] == "Save Draft" ? false : true
      @message = @post.published ? "posted" : "saved"
    end

    def find_post
      @post = FuelPost.find_by_slug(params[:id])
    end

    def set_url
      @url = ["new", "create"].include?(action_name) ? fuel_engine.admin_fuel_posts_path : fuel_engine.admin_fuel_post_path(@post)
    end

end
