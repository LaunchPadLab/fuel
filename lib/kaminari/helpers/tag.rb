module Kaminari
  module Helpers
    class Tag
      def page_url_for(page)
        Fuel::Engine.routes.url_helpers.url_for @params.merge(@param_name => (page <= 1 ? nil : page), :only_path=>true).symbolize_keys
      end
    end
  end
end