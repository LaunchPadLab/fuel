module Fuel
  class Configuration

    # What kind of comments do you want to add to your blog ? (:active_record, :disqus or :no)
    attr_accessor :layout, :blog_title, :disqus_name, :twitter, :username, :password, :helpers

    def initialize
      @layout = "application"
      @blog_title = "Blog"
      @disqus_name = nil
      @twitter = false
      @username = "admin"
      @password = "password"
      @helpers = ["ApplicationHelper"]
    end

  end
end
