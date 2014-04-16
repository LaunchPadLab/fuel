# Customize Fuel
Fuel.configure do |config|

  # Change the layout to render with the blog
  config.layout = "application"

  # Change title of blog
  config.blog_title = "Blog"

  # Change admin username
  config.username = "admin"

  # Change admin password
  config.username = "password"

  config.helpers = ["ApplicationHelper",
                    #"another_helper",
                    ]

  # Add Disqus
  #config.disqus_name = 'your_disqus_name'

  # Add Twitter
  #config.twitter = true

end
