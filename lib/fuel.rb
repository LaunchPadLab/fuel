require "fuel/engine"
require "redcarpet"
require "kaminari"
require "kaminari/helpers/tag"
require "fuel/configuration"
require "friendly_id"
require "jquery-rails"
require "sass-rails"
require "sass_rails_patch"
require "truncate_html"
require "paperclip"
require "bourbon"
require "neat"
require "pickadate-rails"
require "aws-sdk"
require "jquery-fileupload-rails"
require "fuel/aws"
require "github/markup"
require "rouge"
require "rouge/plugins/redcarpet"
require "fuel/html"

module Fuel

  def self.configure(&block)
    block.call(configuration)
    configure_aws
    Rails.application.config.assets.precompile += %w( fuel/wysihtml.css )
  end

  def self.configure_aws
    AWS.config( access_key_id:     configuration.aws_access_key,
                secret_access_key: configuration.aws_secret_access_key )
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end
