require 'rails_helper'

RSpec.describe Services::StatisticsRecorder do
  let(:url) { Faker::Internet.url }
  let(:link) { Link.create(url:, signature: "sign") }

  let(:request) do
    double(user_agent: "Firefox", uuid: "462b1399-3369-4460-b6a2-efa35e5f4d07", remote_ip: "1.1.1.1")
  end

  subject { described_class.run(link:, request:) }

  it "increments visits count" do
    expect { subject }.to change { link.statistics[:visits_count] }.from(0).to(1)
    expect(link.visits.last.agent).to include(
      "user_agent" => "Firefox",
      "remote_ip" => "1.1.1.1",
      "request_id" => "462b1399-3369-4460-b6a2-efa35e5f4d07"
    )
    expect { described_class.run(link:, request:) }.to change { link.statistics[:visits_count] }.from(1).to(2)
  end
end
