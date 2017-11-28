module HealthDiagnotic
  class BetweenInspectionTable
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
      if range.min.nil?
        range.result_cd if value <= range.max
      elsif range.max.nil?
        range.result_cd if value >= range.min
      elsif value.between?(range.min, range.max)
        range.result_cd
      end
    end

    def nil_to_i(s)
      Float(s)
    rescue ArgumentError
      nil
    end

    def to_inspection_table(line)
      s = line.chomp.split(',')
      BetweenInspectionTableValue.new(nil_to_i(s[0]), nil_to_i(s[1]), s[2])
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
