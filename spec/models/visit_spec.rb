require 'rails_helper'

RSpec.describe Visit, type: :model do
  let(:link) { Link.create(url: "https://gosuslugi.ru", signature: "777") }
  let(:agent_data) { { "agent" => "Mozilla", "host" => "localhost" } }
  let(:visit) { Visit.new(link:, agent: agent_data) }

  it "stores agent data" do
    expect(visit).to be_valid
    expect(visit.save).to be_truthy
    expect(visit.reload.agent).to eq(agent_data)
  end
end
