module HealthDiagnotic
  # TestItem is
  class TestItem
    include Comparable

    attr_reader :normal_range

    def initialize(test_item_key)
      @test_item_key = test_item_key
      @normal_ranges = get_normal_range
    end

    def name
      @test_item_key.name
    end

    def sex
      @test_item_key.sex
    end

    def ==(other)
      @test_item_key.eql?(other)
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

    def get_normal_range
      @normal_range = HealthDiagnotic::NormalRange.new(4.6, 6.1, 'A')

      ranges = []
      ranges << HealthDiagnotic::NormalRange.new(nil, 4.5, 'B')
      ranges << HealthDiagnotic::NormalRange.new(4.6, 6.1, 'A')
      ranges << HealthDiagnotic::NormalRange.new(6.2, 6.7, 'B')
      ranges << HealthDiagnotic::NormalRange.new(6.8, 7.1, 'C')
      ranges << HealthDiagnotic::NormalRange.new(7.2, nil, 'D')

      ranges
    end
  end
end
