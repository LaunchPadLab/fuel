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

module Fuel

  def self.configure(&block)
    block.call(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end
