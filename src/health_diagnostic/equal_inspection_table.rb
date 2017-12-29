module HealthDiagnostic
  class EqualInspectionTable < InspectionTable
    def initialize(filename)
      @inspection_table = inspection_table_reader(filename)
    end

    def determine_result_code(value)
      result_cd = nil
      @inspection_table.each do |range|
        result_cd = compare_inspection_table(value, range)
        break if result_cd
      end

      result_cd
    end

    def initialize_inspection_value(rec)
      EqualInspectionTableValue.new(rec)
    end

    private

    def compare_inspection_table(value, range)
      if range.value[0] == '>' && value.to_i > range.value.to_i
        range.result_cd
      elsif value == range.value
        range.result_cd
      end
    end
  end
end
