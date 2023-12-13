require 'rails_helper'

RSpec.describe Services::StatisticsRecorder do
  let(:url) { Faker::Internet.url }
  let(:link) { Link.create(url:, signature: "sign") }
  let(:request) { double(user_agent: { agent: "Firefox" }) }

  subject { described_class.run(link:, request:) }

  it "increments visits count" do
    expect { subject }.to change { link.statistics[:visits_count] }.from(0).to(1)
    expect { described_class.run(link:, request:) }.to change { link.statistics[:visits_count] }.from(1).to(2)
  end
end
