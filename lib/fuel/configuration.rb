module Fuel
  class Configuration

    # What kind of comments do you want to add to your blog ? (:active_record, :disqus or :no)
    attr_accessor :layout, :blog_title, :disqus_name, :twitter

    def initialize
      @layout = "application"
      @blog_title = "Blog"
      @disqus_name = nil
      @twitter = false
    end

  end
end
