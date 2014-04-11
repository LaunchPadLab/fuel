$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fuel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fuel"
  s.version     = Fuel::VERSION
  s.authors     = ["Ryan Francis"]
  s.email       = ["ryan.p.francis@gmail.com"]
  s.homepage    = "http://launchpadlab.com"
  s.summary     = "Fuel is a dead simple blogging gem (mountable engine)"
  s.description = "Fuel's goal is to be simple yet customizable."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
  s.add_dependency "friendly_id", '~> 5.0.0'
  s.add_dependency "redcarpet", '~> 3.0.0'
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
end
