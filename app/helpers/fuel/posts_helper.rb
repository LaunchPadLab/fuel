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

    def method_missing method, *args, &block
      fuel.send(method, *args)
    end

    def embedded_svg filename, options={}
      path = Rails.application.assets.find_asset(filename).pathname
      file = File.read(path)
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css 'svg'
      if options[:class].present?
        svg['class'] = options[:class]
      end
      doc.to_html.html_safe
    end

    def hide_published_at(post)
      @post.is_published ? '' : 'display:none;'
    end

    def s3_direct_post
      @s3_direct_post ||= (
        return unless s3_bucket.present?
        s3_bucket.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
      )
    end

    def format_options
      Fuel::Post::Formats::DISPLAY.dup.invert
    end

  end
end
