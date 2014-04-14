module Fuel
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    if Rails.version[0].to_i < 4
      attr_accessible :tag, :author, :content, :title
    end

    validates_presence_of :title, :content, :author, if: :is_published
    paginates_per 5

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
