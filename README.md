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

You will probably want the blog posts to render within an existing layout of your application. In config/fuel.rb, uncomment the following line and change "application" to the name of the appropriate layout:

```ruby
config.layout = "application"
```
