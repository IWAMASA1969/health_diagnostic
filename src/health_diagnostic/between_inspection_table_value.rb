module HealthDiagnotic
  # NormalRange is value for to determine the result of the test item.
  class BetweenInspectionTableValue
    attr_reader :min, :max, :result_cd

    def initialize(min, max, result_cd)
      @min = min
      @max = max
      @result_cd = result_cd
    end

    def ==(other)
      min_equal?(other) && max_equal?(other) && result_cd_equal?(other)
    end

    private

    def min_equal?(other)
      @min == other.min
    end

    def max_equal?(other)
      @max == other.max
    end

    def result_cd_equal?(other)
      @result_cd == other.result_cd
    end
  end
end
