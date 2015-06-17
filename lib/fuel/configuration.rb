module Fuel
  class Configuration

    # What kind of comments do you want to add to your blog ? (:active_record, :disqus or :no)
    attr_accessor :layout, :blog_title, :disqus_name, :twitter, :username, :password, :helpers, :paginates_per,
        :featured_image_settings, :avatar_settings, :facebook_app_id, :site_name, :blog_description, :tags, :logo

    def initialize
      @layout = "application"
      @blog_title = "Blog"
      @blog_description = "A list of posts about a topic"
      @disqus_name = nil
      @twitter = false
      @username = "admin"
      @password = "password"
      @helpers = ["ApplicationHelper"]
      @featured_image_settings = {
        styles: {
          thumb: "100x100>", medium: "300x300>"
        }
      }
      @avatar_settings = {
        styles: {
          thumb: "100x100>", medium: "300x300>"
        }
      }
      @paginates_per = 5
      @facebook_app_id = nil
      @site_name = nil
      @tags = ["Customize", "These", "Options", "In", "config/initializers/fuel.rb"]
      @logo = "fuel/logo.svg"
    end

  end
end
