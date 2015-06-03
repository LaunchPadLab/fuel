module Fuel
  module Admin
    class AuthorsController < FuelController
      layout "fuel/application"
      before_filter :find_authors
      before_filter :find_author, only: [:edit, :update, :destroy]
      before_filter :set_url, only: [:new, :create, :edit, :update]

      def index
        @author = @authors.first
        set_url
      end

      def new
        @author = Fuel::Author.new
      end

      def create
        if Rails.version[0].to_i < 4
          @author = Fuel::Author.new(params[:fuel_author])
        else
          @author = Fuel::Author.new(author_params)
        end

        if @author.save
          redirect_to fuel.admin_authors_path, notice: "Your author was successfully #{@message}."
        else
          render action: "new"
        end
      end

      def edit

      end

      def update
        if Rails.version[0].to_i < 4
          @author.attributes = params[:fuel_author]
        else
          @author.attributes = author_params
        end

        if @author.save
          redirect_to fuel.admin_authors_path, notice: "Author was updated and #{@message}"
        else
          render action: "edit"
        end
      end

      def destroy
        @author.posts.each do |post|
          post.author_id = nil
          post.save
        end
        @author.destroy
        redirect_to fuel.admin_authors_path, notice: "Author was successfully deleted"
      end

      def show
      end

      private

        def author_params
          params.require(:fuel_author).permit(:first_name, :last_name, :title, :bio, :avatar, :email, :twitter, :github, :dribbble)
        end

        def find_author
          @author = Fuel::Author.find_by_id(params[:id])
        end

        def find_authors
          @authors = Fuel::Author.order("first_name ASC")
        end

        def set_url
          @url = ["new", "create"].include?(action_name) ? fuel.admin_authors_path : fuel.admin_author_path(@author)
        end

    end
  end
end