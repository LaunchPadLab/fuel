require "fuel/engine"
require "redcarpet"
require "kaminari"
require "kaminari/helpers/tag"
require "fuel/configuration"
require "friendly_id"
require "jquery-rails"
require "sass-rails"
require "truncate_html"
require "paperclip"
require "bourbon"
require "neat"
require "pickadate-rails"
require "wysihtml/rails"

module Fuel

  def self.configure(&block)
    block.call(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end
