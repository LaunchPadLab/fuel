module Fuel
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../../templates', __FILE__)
      desc "Creates a Fuel initializer in config/initializers, adds/migrates Fuel migration files and migrates the files, and adds the appropriate route to config/routes"

      def install
        run 'bundle install'
        route "mount Fuel::Engine => '/blog'"
        rake 'fuel:install:migrations'
        rake 'db:migrate'
      end

      def copy_initializer
        template "fuel.rb", "config/initializers/fuel.rb"
      end

    end
  end
end
