require "spec_helper"

describe OctopusPrime::Resolver do
  subject(:resolver) { described_class.new(max_value: max_value) }

  describe "#call" do
    context "with a max_value of 50 and a count of 10" do
      let(:max_value) { 50 }
      let(:count) { 10 }

      it "returns the first 10 primes" do
        expect(resolver.call(count: count)).to eq(
          [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
        )
      end
    end

    context "with a max_value of 20 and a count of 10" do
      let(:max_value) { 20 }
      let(:count) { 10 }

      it "raises a LimitReached error" do
        expect { resolver.call(count: count) }.to raise_error(OctopusPrime::LimitReached)
      end
    end
  end
end
