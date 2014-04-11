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

**Paths**

* Path to Admin Panel: /blog/admin
* Path to Blog: /blog

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

Other Customization Options
--------------------

**Disqus Commenting**

In config/initializers/fuel.rb, uncomment the following line and replace the name with your disqus account name:

```
config.disqus_name = 'your_disqus_name'
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
