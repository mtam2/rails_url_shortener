require "rails_helper"

RSpec.describe "Redirect", type: :request do

  describe "#redirect" do
    context "when submitting invalid parameters" do
      it "should return errors and status 404" do
        get "/bad_link"
        expect(response.status).to eq(404)
      end
    end

    context "when submitting valid parameters" do
      it "should redirect and return status 302" do
        link_uuid = FactoryBot.create(:link).uuid
        get "/#{link_uuid}"
        expect(response.status).to eq(302)
      end
    end
  end

end
