module HealthDiagnotic
  class EqualInspectionTable
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

    private

    def compare_inspection_table(value, range)
      if range.value[0] == '>' && value.to_i > range.value.to_i
        range.result_cd
      elsif value == range.value
        range.result_cd
      end
    end

    def to_inspection_table(line)
      s = line.chomp.split(',')
      EqualInspectionTableValue.new(s[0], s[1])
    end

    def inspection_table_reader(filename)
      ranges = []
      File.open(filename) do |file|
        file.each_line do |line|
          ranges << to_inspection_table(line)
        end
      end
      ranges
    end
  end
end
