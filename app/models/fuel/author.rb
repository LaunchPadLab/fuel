module Fuel
  class Author < ActiveRecord::Base

    has_many :posts

    if Rails.version[0].to_i < 4
      attr_accessible :first_name, :last_name, :title, :bio, :avatar, :email, :twitter, :github, :dribbble, :start_date
    end

    def full_name
      [first_name, last_name].compact.join(" ")
    end

    has_attached_file :avatar, :styles => { :medium => Fuel.configuration.avatar_settings[:styles][:medium], :thumb => Fuel.configuration.avatar_settings[:styles][:thumb] }, :default_url => "fuel/default-img.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  end
end
