module HealthDiagnotic
  # TestItem is
  class TestItem
    include Comparable

    def initialize(test_item_key)
      @test_item_key = test_item_key

      test_item_property = test_item_property_reader(@test_item_key.name)

      filename = normal_range_test_item(test_item_property)
      @inspection_table =
        inspection_table_factory(test_item_property, filename)
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
      @inspection_table.determine_result_code(value)
    end

    def be_under_treatment?
      be_under_treatment_cd
    end

    private

    def inspection_table_factory(property, filename)
      case property.condition
      when 'between' then
        BetweenInspectionTable.new(filename)
      when 'equal' then
        EqualInspectionTable.new(filename)
      end
    end

    def be_under_treatment_cd
      'F'
    end

    def to_test_item_property(line, key)
      s = line.chomp.split(',')
      TestItemProperty.new(s[0], s[1], s[2]) if s[0] == key
    end

    def test_item_property_reader(name)
      property = nil
      filename = ENV['TEST_DATA'] + 'test_item.txt'
      File.open(filename) do |file|
        file.each_line do |line|
          property = to_test_item_property(line, name)
          break if property
        end
      end
      property
    end

    def normal_range_test_item(property)
      sex = property.sex == 'none' ? '' : '_' + @test_item_key.sex.to_s
      ENV['TEST_DATA'] + property.name + sex + '.txt'
    end
  end
end
