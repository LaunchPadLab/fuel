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
