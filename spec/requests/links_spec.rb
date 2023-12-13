require 'rails_helper'

RSpec.describe "Links", type: :request do
  describe "POST /urls" do
    let(:url) { "https://www.google.com?s=123" }
    let(:params) { { url: } }

    let(:request) { post("/urls", params:) }

    it "stores link" do
      expect { request }.to change { Link.find_by(url:) }.from(nil)
    end
  end

  describe "GET /urls/:short_url" do
    let(:link) { Link.create(url: "https://microsoft.com/outlook", signature: "123") }
    let(:request) { get("/urls/123") }

    it "redirects to stored url and records stats" do
      expect(link.visits_count).to be(0)

      request

      expect(response).to redirect_to("https://microsoft.com/outlook")
      expect(link.reload.visits_count).to be(1)
    end
  end
end
