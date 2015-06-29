Fuel
====================
[![Code Climate](https://codeclimate.com/github/LaunchPadLab/fuel.png)](https://codeclimate.com/github/LaunchPadLab/fuel)
[![Code Climate](https://codeclimate.com/github/LaunchPadLab/fuel/coverage.png)](https://codeclimate.com/github/LaunchPadLab/fuel)

By [LaunchPad Lab](http://launchpadlab.com).

Stop developing Rails blogs and start writing your actual blog posts with this dead simple blogging engine for Rails.

Installation
--------------------

Gemfile:

```ruby
gem "fuel"
```

Terminal:

```
bundle
rails g fuel:install
```


Basic Usage
--------------------

**Paths**

* Path to Admin Panel: /blog/admin
* Path to Blog: /blog

**Admin Username / Password**

The default username and password is admin and password, respectively. You can change these in config/initializers/fuel.rb:

```ruby
config.username = "admin"

config.password = "password"
```

**Views**

If you want to customize the views, you can generate them in terminal:

```
rails generate fuel:views
```

**Layout**

You will probably want the blog posts to render within an existing layout of your application. By default, it will render within "application" layout. You can change this in config/initializers/fuel.rb:

```ruby
config.layout = "application"
```

**Logo**

You can add your own logo to be used in the Blog Admin backoffice. Add your logo's image to your Rails app's images folder (app/assets/images) then update config/initializers/fuel.rb to reference that image like below. Note that the image should be square and at least 58 x 58 pixels.

```ruby
config.logo = "your-image.png"
```


Paperclip + S3
--------------------

Fuel ships with Paperclip and S3 for uploading images to your blog posts. To get these working, all you need to do is pass the right credentials to the below variables defined in config/initializers/fuel.rb:

```ruby
  # AWS S3 SETTINGS
  config.aws_bucket = ENV['AWS_BUCKET']
  config.aws_access_key = ENV["AWS_ACCESS_KEY"]
  config.aws_secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
```

We recommend using [Figaro](https://github.com/laserlemon/figaro) to properly set these environment variables:

```yml
# config/application.yml

AWS_ACCESS_KEY: your-s3-access-key
AWS_SECRET_ACCESS_KEY: your-s3-secret-key

development:
  AWS_BUCKET: your-development-s3-bucket
production:
  AWS_BUCKET: your-production-s3-bucket
```


In order for the uploads to work locally, you will need to change your CORS settings on your development S3 bucket (in Amazon S3's admin console). You can find the file in: your-bucket => Properties => Permissions => Edit CORS Configuration

```
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <CORSRule>
    <AllowedOrigin>http://localhost:3000</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <AllowedMethod>POST</AllowedMethod>
    <AllowedMethod>PUT</AllowedMethod>
    <AllowedHeader>*</AllowedHeader>
  </CORSRule>
</CORSConfiguration>
```


Social Integration
--------------------

To set proper og:graph meta data for your blog, add the following to the head of your main layout (such as application.html.erb):

```
<% if content_for?(:meta_tags) %>
  <%= yield(:meta_tags) %>
<% else %>
  <!-- default meta tags here -->
<% end %>
```

**Twitter**

Set config.twitter = true in initializer:

```
# config/initializers/fuel.rb
config.twitter = true

```


SEO
----------

To see our HTML `<title>` and `<meta> description` for your blog, you have access to two instance variables: `@title` and `@description`. These should be called in your `layout` template for your blog as follows:

```
<title><%= @title %></title>
<meta name="description" content="<%= @description %>">
```

Note:

For your blog index page, `@title` and `@description` are defined in your Fuel configuration file.

For your blog post show page, `@title` and `@description` are defined by the values on your post for `seo_title` and `seo_description` respectively.


**Facebook Share**

Note: the purpose of this integration is for creating a custom share dialog link via the Javascript SDK. For more simplistic integrations, like the default Facebook Share button, please see this guide: https://developers.facebook.com/docs/plugins/share-button

1. Create a Facebook application via developer.facebook.com and put your application ID in Fuel's initializer file (config/initializers/fuel.rb)
2. Add a link in your view with class "fuel-fb" and data-url corresponding with the post:

```
<%= link_to "Facebook", '#', class: "fuel-fb", data: { url: fuel.post_url(@post) } %>
```

Note that until your application is deployed to a public domain, Facebook will not pull your og:graph meta information into the share dialog window.


Other Customization Options
--------------------


**Disqus Commenting**

In config/initializers/fuel.rb, uncomment the following line and replace the name with your disqus account name:

```
config.disqus_name = 'your_disqus_name'
```

**Including Your Own Helpers**

By default, Fuel will only include your ApplicationHelper. You can tell Fuel to include additional helper files as well at config/initializers/fuel.rb:

```ruby
config.helpers = ["ApplicationHelper",
                  #"another_helper",
                  ]
```


The MIT License (MIT)
--------------------

Copyright (c) 2014 LaunchPad Lab

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
