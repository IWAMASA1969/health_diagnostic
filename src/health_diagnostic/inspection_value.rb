module HealthDiagnostic
  class InspectionValue
    attr_reader :result_cd

    def initialize(result_cd)
      @result_cd = result_cd
    end
  end
end
