module Fuel
  module Generators

    class ViewsGenerator < Rails::Generators::Base
      desc "Copies Fuel views to your application."

      include Thor::Actions

      source_root File.expand_path('../../../../app/views', __FILE__)

      def copy_views
        directory 'fuel', 'app/views/fuel'
      end

    end
  end
end
