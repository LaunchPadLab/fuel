module Fuel
  class Configuration

    # What kind of comments do you want to add to your blog ? (:active_record, :disqus or :no)
    attr_accessor :layout, :blog_title, :disqus_name, :twitter, :username, :password, :helpers, :paginates_per, :featured_image_settings, :facebook_app_id, :site_name

    def initialize
      @layout = "application"
      @blog_title = "Blog"
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
      @paginates_per = 5
      @facebook_app_id = nil
      @site_name = nil
    end

  end
end
