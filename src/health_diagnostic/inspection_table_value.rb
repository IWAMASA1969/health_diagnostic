module HealthDiagnostic
  # NormalRange is value for to determine the result of the test item.
  class InspectionTableValue
    def initialize(value)
      @result_cd = result_cd_factory(value['result'])
    end

    def result_cd_factory(value)
      if 'value'.casecmp(value['type'].to_s)
        InspectionValue.new(value['value'].to_s)
      else
        nil
      end
    end

    def result_cd
      @result_cd.result_cd
    end
  end
end
