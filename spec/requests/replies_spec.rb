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

RSpec.describe "/replies", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Reply. As you add validations to Reply, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Reply.create! valid_attributes
      get replies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      reply = Reply.create! valid_attributes
      get reply_url(reply)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_reply_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      reply = Reply.create! valid_attributes
      get edit_reply_url(reply)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Reply" do
        expect {
          post replies_url, params: { reply: valid_attributes }
        }.to change(Reply, :count).by(1)
      end

      it "redirects to the created reply" do
        post replies_url, params: { reply: valid_attributes }
        expect(response).to redirect_to(reply_url(Reply.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Reply" do
        expect {
          post replies_url, params: { reply: invalid_attributes }
        }.to change(Reply, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post replies_url, params: { reply: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested reply" do
        reply = Reply.create! valid_attributes
        patch reply_url(reply), params: { reply: new_attributes }
        reply.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the reply" do
        reply = Reply.create! valid_attributes
        patch reply_url(reply), params: { reply: new_attributes }
        reply.reload
        expect(response).to redirect_to(reply_url(reply))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        reply = Reply.create! valid_attributes
        patch reply_url(reply), params: { reply: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested reply" do
      reply = Reply.create! valid_attributes
      expect {
        delete reply_url(reply)
      }.to change(Reply, :count).by(-1)
    end

    it "redirects to the replies list" do
      reply = Reply.create! valid_attributes
      delete reply_url(reply)
      expect(response).to redirect_to(replies_url)
    end
  end
end
