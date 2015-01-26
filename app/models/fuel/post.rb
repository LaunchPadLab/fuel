module Fuel
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    if Rails.version[0].to_i < 4
      attr_accessible :tag, :author, :content, :title, :featured_image_url, :teaser, :featured_image
    end

    has_attached_file :featured_image, :styles => { :medium => Fuel.configuration.featured_image_settings[:styles][:medium], :thumb => Fuel.configuration.featured_image_settings[:styles][:thumb] }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :featured_image, :content_type => /\Aimage\/.*\Z/

    validates_presence_of :title, :content, :author, if: :is_published
    paginates_per Fuel.configuration.paginates_per.to_i

    scope :recent_published_posts, -> { where(published: true).order("created_at DESC") }

    def should_generate_new_friendly_id?
      new_record? #Don't generate new id on edit
    end

    def save_as_draft
      self.published = false
    end

    def is_published
      self.published
    end

    def prioritized_featured_image_url(type = :original)
      featured_image_file_name.present? ? featured_image.url(type) : featured_image_url
    end

  end
end
