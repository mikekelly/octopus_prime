
module OctopusPrime
  class Resolver
    def initialize(max_value:)
      @max_value = max_value
    end

    def call(count:)
      Array.new.tap do |discovered_primes|
        search_range = (2..max_value).to_a
        loop do
          smallest_remaining_prime = search_range.shift
          discovered_primes << smallest_remaining_prime
          search_range.delete_if { |number| number % smallest_remaining_prime == 0 }
          break if discovered_primes.count == count
          raise LimitReached if search_range.empty?
        end
      end
    end

    private

    attr_reader :max_value
  end

  LimitReached = Class.new(StandardError)
end
