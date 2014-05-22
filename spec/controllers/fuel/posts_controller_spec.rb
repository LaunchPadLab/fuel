require 'spec_helper'

describe Fuel::PostsController do

  routes { Fuel::Engine.routes }

  describe 'GET #index' do
    before(:each) do
      @num_published_posts = 10
      @num_published_posts.times do |post|
        create(:post)
      end
      create(:unpublished_post)
    end

    it "populates an array of posts" do
      get :index
      expect(assigns(:posts).count).to be > 0
    end
    it "populates an array of posts that is not greater than the paginates number" do
      get :index
      expect(assigns(:posts).count).to be <= Fuel.configuration.paginates_per
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before :each do
      @post = create(:post)
    end

    it "assigns the requested post to @post using slug" do
      get :show, id: @post.slug
      expect(assigns(:post)).to eq @post
    end

    it "assigns the requested post to @post using ID" do
      get :show, id: @post.id
      expect(assigns(:post)).to eq @post
    end

    it "truncates title to 70 characters or less" do
      get :show, id: @post.slug
      title_length = assigns(:title).length
      expect(title_length).to be < 70
    end

  end

end
