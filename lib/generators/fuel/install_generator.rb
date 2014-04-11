module Fuel
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../../templates', __FILE__)

      desc "Creates a Fuel initializer in config/initializers"

      def copy_initializer
        template "fuel.rb", "config/initializers/fuel.rb"
      end

    end
  end
end
