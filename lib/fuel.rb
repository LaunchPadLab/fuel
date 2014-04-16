require "fuel/engine"
require "redcarpet"
require "kaminari"
require "fuel/configuration"
require "friendly_id"

module Fuel

  def self.configure(&block)
    block.call(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end
