module HealthDiagnotic
  # TestItem is
  class TestItem
    include Comparable

    attr_reader :normal_range

    def initialize(test_item_key)
      @test_item_key = test_item_key

      filename = ENV['TEST_DATA'] + @test_item_key.name + '.txt'
      @normal_ranges = normal_range_reader(filename)
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

    def normal_range_cd?(other)
      other == normal_range_cd
    end

    def be_under_treatment_cd
      'F'
    end

    def normal_range_reader(filename)
      ranges = []
      File.open(filename) do |file|
        file.each_line do |line|
          ranges << to_normal_range(line)
          element = ranges.last
          @normal_range = element if normal_range_cd?(element.result_cd)
        end
      end
      ranges
    end

    def nil_to_i(s)
      Float(s)
    rescue ArgumentError
      nil
    end

    def to_normal_range(line)
      s = line.chomp.split(',')
      NormalRange.new(nil_to_i(s[0]), nil_to_i(s[1]), s[2])
    end
  end
end
