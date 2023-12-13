require 'rails_helper'

RSpec.describe Services::StatisticsCleaner do
  let(:link) { Link.create(url: "http://roskomnadzor.ru", signature: "restriction") }

  let!(:visits) do
    10.times { Visit.create(link:, agent: {}) }
  end

  subject { described_class.run(link:) }

  it "compacts statistics" do
    expect(link.statistics[:visits_count]).to be(10)
    expect { subject }.to change { link.visits.count }.by(-10)
    expect(link.statistics[:visits_count]).to be(10)
    expect(link.reload.statistics[:visits_count]).to be(10)
  end
end
