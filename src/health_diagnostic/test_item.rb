module HealthDiagnotic
  class TestItem
    include Comparable

    attr_reader :name, :normal_range

    def initialize(name, sex)
      @name = name
      @sex = check_sex(sex)
      @normal_ranges = []
    end

    def ==(other)
      @name == other.name && @sex == other.sex
    end

    def <<(normal_range)
      @normal_ranges << normal_range
      @normal_range = normal_range if normal_range.result_cd == normal_range_cd
    end

    def determine_result_code(value)
      @normal_ranges.each { |range|
        if range.min.nil?
          return range.result_cd if value <= range.max
        elsif range.max.nil?
          return range.result_cd if value >= range.min
        elsif value.between?(range.min, range.max)
          return range.result_cd
        end
      }

      nil
    end

    def be_under_treatment?
      be_under_treatment_cd
    end

    private
    def normal_range_cd
      'A'
    end

    def be_under_treatment_cd
      'F'
    end

    def check_sex(sex)
      raise ArgumentError if sex != :male && sex != :female
    end
  end
end
