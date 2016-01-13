module Fuel
  module Admin
    class AuthorsController < AdminController
      layout "fuel/application"
      before_filter :find_authors
      before_filter :find_author, only: [:edit, :update, :destroy]
      before_filter :set_url, only: [:new, :create, :edit, :update]

      def index
      end

      def new
        @author = Fuel::Author.new
      end

      def create
        @params_hash = Rails.version[0].to_i < 4 ? params[:fuel_author] : author_params
        set_start_date
        @author = Fuel::Author.new(@params_hash)

        if @author.save
          redirect_to fuel.admin_authors_path, notice: "Your author was successfully #{@message}."
        else
          render action: "new"
        end
      end

      def edit

      end

      def update
        @params_hash = Rails.version[0].to_i < 4 ? params[:fuel_author] : author_params
        set_start_date
        @author.attributes = @params_hash

        if @author.save
          redirect_to fuel.edit_admin_author_path(@author), notice: "Author was updated and #{@message}"
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
        @author = Fuel::Author.find(params[:id])

        respond_to do |format|
          format.json { render json: @author }
        end
      end

      private

        def set_start_date
          start_date_string = @params_hash[:start_date]
          return unless start_date_string.present?
          start_datetime = start_date_string.present? ? DateTime.strptime(start_date_string, "%m/%d/%Y") : nil
          @params_hash[:start_date] = start_datetime
        end

        def author_params
          params.require(:fuel_author).permit(:first_name, :last_name, :title, :bio, :avatar, :email, :twitter, :github, :dribbble, :start_date)
        end

        def find_author
          @author = Fuel::Author.find_by_id(params[:id])
        end

        def find_authors
          @authors = Fuel::Author.order("start_date ASC")
        end

        def set_url
          @url = ["new", "create"].include?(action_name) ? fuel.admin_authors_path : fuel.admin_author_path(@author)
        end

    end
  end
end
