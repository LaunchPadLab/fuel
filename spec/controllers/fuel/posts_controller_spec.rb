require 'spec_helper'

describe Fuel::PostsController do

  before :each do
    @post = create(:post)
  end

  describe 'GET #show' do

    it "assigns the requested post to @post using slug" do
      get :show, use_route: :fuel, id: @post.slug
      expect(assigns(:post)).to eq @post
    end

    it "assigns the requested post to @post using ID" do
      get :show, use_route: :fuel, id: @post.id
      expect(assigns(:post)).to eq @post
    end

    it "truncates title to 70 characters or less" do
      get :show, use_route: :fuel, id: @post.slug
      title_length = assigns(:title).length
      expect(title_length).to be < 70
    end

  end

end
