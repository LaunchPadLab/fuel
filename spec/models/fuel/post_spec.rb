require 'spec_helper'

module Fuel
  describe Post do
    it "is valid with a title, author, tag, content, and published" do
      post = build(:post)
      expect(post).to be_valid
    end

    required_attributes = [:title, :author, :content]
    required_attributes.each do |attr|
      it "is invalid without a #{attr}" do
        post = build(:post, attr => nil)
        expect(post).to have(1).errors_on(attr)
      end
      it "is valid without a #{attr} when not published (i.e. saved as a draft)" do
        post = build(:post, attr => nil, published: false)
        expect(post).to have(0).errors_on(attr)
      end
    end
  end
end
