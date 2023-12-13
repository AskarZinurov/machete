require 'rails_helper'

RSpec.describe "Statistics", type: :request do
  describe "GET /urls/:short_url/stats" do
    let(:link) { Link.create(url: "https://oracle.com", signature: "123123") }
    let(:request) { get("/urls/#{link.signature}/stats") }

    let(:response_json) { JSON.parse(response.body) }

    it "returns link stats" do
      request

      expect(response_json).to include("visits_count" => 0)
    end
  end
end
