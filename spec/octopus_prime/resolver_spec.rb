require "spec_helper"

describe OctopusPrime::Resolver do
  subject(:resolver) { described_class.new(max_value: max_value) }

  describe "#call" do
    context "with a max_value of 1000 and a count of 10" do
      let(:max_value) { 1000 }
      let(:count) { 10 }

      it "returns the first 10 primes" do
        expect(resolver.call(count: count)).to eq(
          [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
        )
      end
    end
  end
end
