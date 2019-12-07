require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe "#create" do
    context "when submitting invalid parameters" do
      it "should return errors and status 400" do
        post :create, params: {link: {original_link: "blah"}}
        expect(response.status).to eq(400)
      end
    end

    context "when submitting empty parameters" do
      it "should return errors and status 400" do
        post :create, params: {link: {original_link: nil}}
        expect(response.status).to eq(400)
      end
    end

    context "when submitting valid parameters" do
      it "should return link and status 302" do
        post :create, params: {link: {original_link: "https://www.google.com/"}}
        expect(response.status).to eq(302)
      end
    end
  end

  describe "#show" do
    context "when submitting invalid parameters" do
      it "should return errors and status 404" do
        get :show, params: {uuid: "not valid"}
        expect(response.status).to eq(404)
      end
    end

    context "when submitting valid parameters" do
      it "should redirect and return status 200" do
        link_uuid = FactoryBot.create(:link).uuid
        get :show, params: {uuid: link_uuid}
        expect(response.status).to eq(200)
      end
    end
  end

end
