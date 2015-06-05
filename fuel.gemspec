$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fuel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fuel"
  s.version     = Fuel::VERSION
  s.authors     = ["Ryan Francis"]
  s.email       = ["ryan.p.francis@gmail.com"]
  s.homepage    = "http://github.com/LaunchPadLab/fuel"
  s.summary     = "Fuel is a dead simple blogging gem (mountable engine)"
  s.description = "Fuel's goal is to be a simple yet customizable blogging gem."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "friendly_id"
  s.add_dependency "redcarpet"
  s.add_dependency "kaminari"
  s.add_dependency "jquery-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "truncate_html"
  s.add_dependency "paperclip", ">=3"
  s.add_dependency "aws-sdk", '< 2.0'
  s.add_dependency "bourbon"
  s.add_dependency "neat"
  s.add_dependency "pickadate-rails"
  s.add_dependency "wysiwyg-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "codeclimate-test-reporter"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "better_errors"
  s.add_development_dependency "binding_of_caller"

end
