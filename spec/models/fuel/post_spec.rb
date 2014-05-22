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

    describe "Scope recent published posts" do
      before(:each) do
        @num_published_posts = 3
        @num_published_posts.times do |post|
          create(:post)
        end
        create(:unpublished_post)
        @posts = Fuel::Post.recent_published_posts
      end
      it "returns an array of posts" do
        expect(@posts.count).to be > (0)
      end
      it "only displays published posts" do
        expect(@posts.count).to eq(@num_published_posts)
      end
      it "sorts the posts by created_at datetime" do
        is_ordered = @posts[0].created_at > @posts[1].created_at && @posts[1].created_at > @posts[2].created_at
        expect(is_ordered).to be_true
      end
    end

  end
end
