module HealthDiagnotic
  class TestItemProperty
    attr_reader :name, :sex, :condition

    def initialize(name, sex, condition)
      @name = name
      @sex = sex
      @condition = condition
    end
  end
end
