module HealthDiagnostic
  class BetweenInspectionTable < InspectionTable
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
      BetweenInspectionTableValue.new(rec)
    end

    private

    def compare_inspection_table(value, range)
      if range.min.nil?
        range.result_cd if value <= range.max
      elsif range.max.nil?
        range.result_cd if value >= range.min
      elsif value.between?(range.min, range.max)
        range.result_cd
      end
    end
  end
end
