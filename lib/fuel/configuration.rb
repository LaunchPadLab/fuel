module Fuel
  class Configuration

    # What kind of comments do you want to add to your blog ? (:active_record, :disqus or :no)
    attr_accessor :layout, :inline_main_app_named_routes, :blog_title

    def initialize
      @layout = nil
      @inline_main_app_named_routes = true
      @blog_title = "Blog"
    end

  end
end
