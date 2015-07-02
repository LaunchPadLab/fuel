require 'spec_helper'

describe Fuel::Admin::AuthorsController, type: :controller do

  routes { Fuel::Engine.routes }

  let(:authors) { create_list(:author, number_authors) }
  let(:number_authors) { 5 }

  before(:each) do
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials Fuel.configuration.username, Fuel.configuration.password
    request.env['HTTP_AUTHORIZATION'] = credentials
    authors
  end

  describe 'GET #index' do
    it "populates an array of authors" do
      get :index
      expect(assigns(:authors).count).to eq(number_authors)
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it "it assigns a new Author to @author" do
      get :new
      expect(assigns(:author)).to be_a_new(Author)
    end
    it "renders the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do

    let(:author) { create(:author) }

    it "assigns the requested author to @author" do
      get :edit, id: author
      expect(assigns(:author)).to eq(author)
    end

    it "renders the :edit template" do
      get :edit, id: author
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do

    let(:original_count) { Author.count }

    before(:each) do
      original_count
      post :create, fuel_author: author_hash
    end

    context "with valid attributes" do

      let(:author_hash) { attributes_for(:author) }

      it "saves the new author in the database" do
        new_count = Author.count
        expect(new_count - original_count).to eq(1)
      end

      it "redirects to the index page" do
        expect(response).to redirect_to(admin_authors_path)
      end
    end

    context "with invalid attributes" do
      let(:author_hash) { attributes_for(:author, first_name: nil) }

      it "does not save the new author in the database" do
        new_count = Author.count
        expect(new_count - original_count).to eq(0)
      end
      it "re-renders the :new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do

    let(:author) { create(:author) }
    let(:author_hash) { attributes_for(:author) }

    before(:each) do
      author_hash
    end

    context "with valid attributes" do
      it "updates the author in the database" do
        test_first_name = "UniqueString123"
        put :update, id: author, fuel_author: author_hash.merge(first_name: test_first_name)
        author.reload
        expect(author.first_name).to eq(test_first_name)
      end

      it "redirects to the author edit page" do
        put :update, id: author, fuel_author: author_hash
        expect(response).to redirect_to(edit_admin_author_path(author))
      end
    end

    context "with invalid attributes" do
      it "does not update the author" do
        first_name = "Hopefully I don't persist"
        put :update, id: author, fuel_author: author_hash.merge(first_name: first_name, last_name: nil)
        author.reload
        expect(author.first_name).to_not eq(first_name)
      end

      it "re-renders the #edit template" do
        put :update, id: author, fuel_author: author_hash.merge(first_name: nil)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do

    subject(:author) { create(:author) }

    before(:each) do
      author
    end

    it "deletes the authors" do
      original_count = Author.count
      delete :destroy, id: author
      new_count = Author.count
      expect(original_count - new_count).to eq(1)
    end

    it "redirects to admin/authors#index" do
      delete :destroy, id: author
      expect(response).to redirect_to(admin_authors_path)
    end
  end

end
