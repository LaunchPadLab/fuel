module Fuel
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    if Rails.version[0].to_i < 4
      attr_accessible :tag, :author, :content, :title
    end

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

  end
end
