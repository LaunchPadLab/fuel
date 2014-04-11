Fuel
====================

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
rails generate fuel:install
rake fuel:install:migrations
rake db:migrate
```

config/routes.rb:

```ruby
mount Fuel::Engine => "/blog", as: "blog"
```

Usage
--------------------

**Paths:**

* Path to Admin Panel: /blog/admin
* Path to Blog: /blog

If you want to customize the views, you can generate them with rails generate fuel:views

You will probably want the blog posts to render within an existing layout of your application. By default, it will render within "application" layout. You can change this in config/initializers/fuel.rb:

```ruby
config.layout = "application"
```
