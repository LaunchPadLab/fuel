module Fuel
  module PostsHelper
    Fuel.configuration.helpers.each do |helper|
      include "::#{helper}".constantize
    end

    def markdown(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
          :autolink => true, :space_after_headers => true)
      raw markdown.render(text)
    end

  end
end