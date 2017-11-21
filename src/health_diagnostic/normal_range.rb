module HealthDiagnotic
  class NormalRange
    attr_reader :min, :max, :result_cd

    def initialize(min, max, result_cd)
      @min, @max, @result_cd = min, max, result_cd
    end

    def ==(other)
      @min == other.min && @max == other.max && @result_cd == other.result_cd
    end
  end
end
