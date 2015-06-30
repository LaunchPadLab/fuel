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
      let(:number_posts) { 3 }
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
    end

  end
end
