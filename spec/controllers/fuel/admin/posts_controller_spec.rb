require 'spec_helper'

describe Fuel::Admin::PostsController do

  routes { Fuel::Engine.routes }

  before(:each) do
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials Fuel.configuration.username, Fuel.configuration.password
    request.env['HTTP_AUTHORIZATION'] = credentials
  end

  describe 'GET #index' do
    it "populates an array of posts" do
      get :index
      expect(assigns(:posts).count).to eq(Post.count)
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it "it assigns a new Post to @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
    it "renders the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    before(:each) do
      @post = create(:post)
    end
    it "assigns the requested post to @post" do
      get :edit, id: @post
      expect(assigns(:post)).to eq(@post)
    end

    it "renders the :edit template" do
      get :edit, id: @post
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      before(:each) do
        @original_count = Post.count
        post :create, post: attributes_for(:post)
      end
      it "saves the new post in the database" do
        new_count = Post.count
        expect(new_count - @original_count).to eq(1)
      end
      it "redirects to the show page" do
        expect(response).to redirect_to(fuel_engine.fuel_admin_posts_path)
      end
    end
    context "with invalid attributes" do
      before(:each) do
        @original_count = Post.count
        post :create, post: attributes_for(:invalid_post)
      end
      it "does not save the new post in the database" do
        new_count = Post.count
        expect(new_count - @original_count).to eq(0)
      end
      it "re-renders the :new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @post = create(:post)
    end
    context "with valid attributes" do
      it "updates the post in the database" do
        test_title = "Is this thing on?"
        put :update, id: @post, post: attributes_for(:post, title: test_title)
        @post.reload
        expect(@post.title).to eq(test_title)
      end
      it "redirects to the post" do
        put :update, id: @post, post: attributes_for(:post)
        expect(response).to redirect_to(fuel_engine.fuel_admin_posts_path)
      end
    end
    context "with invalid attributes" do
      it "does not update the post" do
        author = "Tom Cullen"
        put :update, id: @post, post: attributes_for(:post, title: nil, author: author)
        @post.reload
        expect(@post.author).to_not eq(author)
      end
      it "re-renders the #edit template" do
        put :update, id: @post, post: attributes_for(:post, title: nil)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @post = create(:post)
    end
    it "deletes the posts" do
      original_count = Post.count
      delete :destroy, id: @post
      new_count = Post.count
      expect(original_count - new_count).to eq(1)
    end
    it "redirects to admin/posts#index" do
      delete :destroy, id: @post
      expect(response).to redirect_to(fuel_engine.fuel_admin_posts_path)
    end
  end

end









