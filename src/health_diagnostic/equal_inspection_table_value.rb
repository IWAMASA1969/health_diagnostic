module HealthDiagnotic
  # NormalRange is value for to determine the result of the test item.
  class EqualInspectionTableValue
    attr_reader :value, :result_cd

    def initialize(value, result_cd)
      @value = value
      @result_cd = result_cd
    end

    def ==(other)
      value_equal?(other) && result_cd_equal?(other)
    end

    private

    def value_equal?(other)
      @value == other.value
    end

    def result_cd_equal?(other)
      @result_cd == other.result_cd
    end
  end
end
