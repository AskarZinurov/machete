require 'rails_helper'

RSpec.describe Services::Signer do
  let(:url) { Faker::Internet.url }
  let(:link) { Link.new(url:) }

  describe "run" do
    subject { described_class.run(link:) }

    context "when link signed" do
      let(:link) { Link.new(url:, signature: "sign") }

      it { expect(subject).to eq("sign") }
    end
  end

  describe "run!" do
    subject { described_class.run!(link:) }

    context "when link signed" do
      let(:link) { Link.new(url:, signature: "sign") }

      it { expect { subject }.to change { link.signature }.from("sign") }
    end

    context "when link invalid" do
      let(:link) { Link.new }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end
end
