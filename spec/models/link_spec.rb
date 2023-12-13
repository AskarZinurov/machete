require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:url) { Faker::Internet.url }

  subject(:link) { described_class.new(url:) }

  it { expect(link).not_to be_signed }
  it { expect(link).not_to be_valid }

  context "when link signed" do
    subject(:link) { described_class.new(url:, signature: "sign") }

    it { expect(link).to be_signed }
    it { expect(link).to be_valid }
  end
end
