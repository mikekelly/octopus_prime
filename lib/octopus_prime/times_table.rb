module OctopusPrime
  class TimesTable
    def initialize(numbers:)
      @numbers = numbers
    end

    def to_a
      values.map { |y_value| values.map { |x_value| x_value * y_value } }
    end

    private

    attr_reader :numbers

    def values
      [1] + numbers
    end
  end
end
