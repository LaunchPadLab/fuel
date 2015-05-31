module Fuel
  class Author < ActiveRecord::Base

    has_many :posts

    if Rails.version[0].to_i < 4
      attr_accessible :first_name, :last_name, :title, :bio, :avatar
    end

    def full_name
      [first_name, last_name].compact.join(" ")
    end

    has_attached_file :avatar, :styles => { :medium => Fuel.configuration.avatar_settings[:styles][:medium], :thumb => Fuel.configuration.avatar_settings[:styles][:thumb] }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  end
end
