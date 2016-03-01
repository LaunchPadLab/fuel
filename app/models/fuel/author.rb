module Fuel
  class Author < ActiveRecord::Base

    has_many :posts

    if Rails.version[0].to_i < 4
      attr_accessible :first_name, :last_name, :title, :bio, :avatar, :email, :twitter, :github, :dribbble, :start_date
    end

    def full_name
      [first_name, last_name].compact.join(" ")
    end

    if Fuel.configuration.aws_bucket
      has_attached_file :avatar, :styles => { :medium => Fuel.configuration.avatar_settings[:styles][:medium], :thumb => Fuel.configuration.avatar_settings[:styles][:thumb] }, :default_url => "fuel/default-img.jpg", :storage => :s3, :s3_protocol => :https, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
    else
      has_attached_file :avatar, :styles => { :medium => Fuel.configuration.avatar_settings[:styles][:medium], :thumb => Fuel.configuration.avatar_settings[:styles][:thumb] }, :default_url => "fuel/default-img.jpg"
    end

    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    validates :first_name, :last_name, :title, presence: true

    def s3_credentials
      {:bucket => Fuel.configuration.aws_bucket, :access_key_id => Fuel.configuration.aws_access_key, :secret_access_key => Fuel.configuration.aws_secret_access_key}
    end

    def other_posts(post_id)
      @other_posts ||= posts.published.recent.where.not(id: post_id)
    end
  end
end
