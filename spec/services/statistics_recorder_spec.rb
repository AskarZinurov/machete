require 'rails_helper'

RSpec.describe Services::StatisticsRecorder do
  let(:url) { Faker::Internet.url }
  let(:link) { Link.create(url:, signature: "sign") }

  subject { described_class.run(link:) }

  it "increments visits count" do
    expect { subject }.to change { link.reload.visits_count }.from(0).to(1)
    expect { described_class.run(link:) }.to change { link.reload.visits_count }.from(1).to(2)
  end
end
