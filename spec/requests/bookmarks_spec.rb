# rubocop:disable all

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/bookmarks', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Bookmark. As you add validations to Bookmark, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Bookmark.create! valid_attributes
      get bookmarks_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      bookmark = Bookmark.create! valid_attributes
      get bookmark_url(bookmark)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_bookmark_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      bookmark = Bookmark.create! valid_attributes
      get edit_bookmark_url(bookmark)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Bookmark' do
        expect do
          post bookmarks_url, params: { bookmark: valid_attributes }
        end.to change(Bookmark, :count).by(1)
      end

      it 'redirects to the created bookmark' do
        post bookmarks_url, params: { bookmark: valid_attributes }
        expect(response).to redirect_to(bookmark_url(Bookmark.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Bookmark' do
        expect do
          post bookmarks_url, params: { bookmark: invalid_attributes }
        end.to change(Bookmark, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post bookmarks_url, params: { bookmark: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested bookmark' do
        bookmark = Bookmark.create! valid_attributes
        patch bookmark_url(bookmark), params: { bookmark: new_attributes }
        bookmark.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the bookmark' do
        bookmark = Bookmark.create! valid_attributes
        patch bookmark_url(bookmark), params: { bookmark: new_attributes }
        bookmark.reload
        expect(response).to redirect_to(bookmark_url(bookmark))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        bookmark = Bookmark.create! valid_attributes
        patch bookmark_url(bookmark), params: { bookmark: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested bookmark' do
      bookmark = Bookmark.create! valid_attributes
      expect do
        delete bookmark_url(bookmark)
      end.to change(Bookmark, :count).by(-1)
    end

    it 'redirects to the bookmarks list' do
      bookmark = Bookmark.create! valid_attributes
      delete bookmark_url(bookmark)
      expect(response).to redirect_to(bookmarks_url)
    end
  end
end
