# Customize Fuel
Fuel.configure do |config|

  # Change the layout to render with the blog
  config.layout = "application"

  # Change title of blog
  config.blog_title = "Blog"

  # Change description of blog
  # config.blog_description = "A list of posts about a topic"

  # Change admin username
  config.username = "admin"

  # Change admin password
  config.password = "password"

  # Change number of posts to show per page on blog
  config.paginates_per = 5

  config.helpers = ["ApplicationHelper",
                    #"another_helper",
                    ]

  config.featured_image_settings = {
    styles: {
      thumb: "100x100>", medium: "300x300>"
    }
  }

  config.logo = "fuel/logo.svg"

  # Add Disqus
  #config.disqus_name = 'your_disqus_name'

  # Add Twitter
  #config.twitter = true

end
