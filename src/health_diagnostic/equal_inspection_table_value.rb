module HealthDiagnostic
  # NormalRange is value for to determine the result of the test item.
  class EqualInspectionTableValue < InspectionTableValue
    attr_reader :value

    def initialize(value)
      super(value)
      @value = value['condition'].to_s == '' ? nil : value['condition'].to_s
    end

    def ==(other)
      value_equal?(other) && result_cd_equal?(other)
    end

    private

    def value_equal?(other)
      @value == other.value
    end

    def result_cd_equal?(other)
      @result_cd.result_cd == other.result_cd
    end
  end
end
