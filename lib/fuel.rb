require "fuel/engine"
require "redcarpet"
require "kaminari"
require "fuel/configuration"
require "friendly_id"
require "jquery-rails"
require "sass-rails"
require "slim"

module Fuel

  def self.configure(&block)
    block.call(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end
