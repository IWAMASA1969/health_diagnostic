module HealthDiagnostic
  # NormalRange is value for to determine the result of the test item.
  class BetweenInspectionTableValue < InspectionTableValue
    attr_reader :min, :max

    def initialize(value)
      super(value)
      @min = value['min'].to_s == '' ? nil : value['min'].to_s.to_f
      @max = value['max'].to_s == '' ? nil : value['max'].to_s.to_f
    end

    def ==(other)
      min_equal?(other) && max_equal?(other) && result_cd_equal?(other)
    end

    def result_cd
      @result_cd.result_cd
    end

    private

    def min_equal?(other)
      @min == other.min
    end

    def max_equal?(other)
      @max == other.max
    end

    def result_cd_equal?(other)
      @result_cd.result_cd == other.result_cd
    end
  end
end
