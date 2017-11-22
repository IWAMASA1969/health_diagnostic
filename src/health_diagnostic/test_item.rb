module HealthDiagnotic
  # TestItem is
  class TestItem
    include Comparable

    attr_reader :name, :normal_range

    def initialize(name, sex)
      @name = name
      @sex = check_sex(sex)
      @normal_ranges = []
    end

    def ==(other)
      name_equal?(other) && sex_equal?(other)
    end

    def <<(normal_range)
      @normal_ranges << normal_range
      @normal_range = normal_range if normal_range.result_cd == normal_range_cd
    end

    def determine_result_code(value)
      result_cd = nil
      @normal_ranges.each do |range|
        result_cd = compare_normal_range(value, range)
        break if result_cd
      end

      result_cd
    end

    def be_under_treatment?
      be_under_treatment_cd
    end

    private

    def name_equal?(other)
      @name == other.name
    end

    def sex_equal?(other)
      @sex == other.sex
    end

    def compare_normal_range(value, range)
      if range.min.nil?
        range.result_cd if value <= range.max
      elsif range.max.nil?
        range.result_cd if value >= range.min
      elsif value.between?(range.min, range.max)
        range.result_cd
      end
    end

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
