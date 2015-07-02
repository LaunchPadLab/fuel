require 'spec_helper'

module Fuel
  describe Post, type: :model do

    context "draft" do
      subject { build(:post) }
      it { is_expected.to be_valid }
    end

    context "slug" do
      subject { create(:post) }

      it "is expected to generate a slug" do
        expect(subject.slug.length).to be > 0
      end
    end

    context "published" do
      subject { build(:published_post) }

      it { is_expected.to be_valid }
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:content) }
      it { is_expected.to validate_presence_of(:author_id) }
      it { is_expected.to validate_presence_of(:published_at) }
      it { is_expected.to belong_to(:author) }
    end


    describe "scopes" do

      let(:published_posts) { create_list(:published_post, number_posts) }
      let(:number_posts) { 10 }
      let(:draft) { create(:post) }

      before(:each) do
        published_posts
      end

      context "published" do
        subject(:published) { Fuel::Post.published }

        it "returns an array of posts" do
          expect(published.count).to be > (0)
        end

        it "only displays published posts" do
          expect(published.count).to eq(number_posts)
        end
      end

      context "recent" do
        subject(:recent) { Fuel::Post.recent }

        it "sorts the posts by created_at datetime" do
          is_ordered = recent[0].created_at > recent[1].created_at && recent[1].created_at > recent[2].created_at
          expect(is_ordered).to be_truthy
        end
      end

      context "next" do
        let(:post) { published_posts.last }
        subject(:next_post) { post.next }

        before(:each) do
          post
          next_post
        end

        it "should have a published_at date less than or equal to the current posts' published_at date" do
          expect(next_post.published_at).to be <= post.published_at
        end

        it "should not be the same post as the current post" do
          expect(next_post.id).to_not eq(post.id)
        end

        it "there should be no other posts with a published_at date less than the current post's published_at date yet greater than the next posts' published_at date" do
          all_posts = Fuel::Post.published
          better_option = all_posts.detect do |p|
            [post.id, next_post.id].exclude?(p.id) && p.published_at < post.published_at && p.published_at > next_post.published_at
          end
          expect(better_option).to be_blank
        end

      end

    end

    describe "instance methods" do

      let(:post) { create(:post) }


    end

  end
end
