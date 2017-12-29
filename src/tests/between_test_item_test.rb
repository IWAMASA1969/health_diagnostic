require './health_diagnostic/inspection_table.rb'
require './health_diagnostic/inspection_table_value.rb'
Dir.glob(File.join('.', '**', 'health_diagnostic/*.rb')).each do |file|
  require file
end

require 'minitest/autorun'

class BetweenTestItemTest < Minitest::Test
  def setup
    @test_item_key = HealthDiagnostic::TestItemKey.new('HbA1c', :male)
    @test_item =
      HealthDiagnostic::TestItemFriweightFactory.instance[@test_item_key]
  end

  def test_result_cd_a
    result_cd = @test_item.determine_result_code(5.5)
    assert_equal('A', result_cd, 'result code A')
  end

  def test_result_cd_b_min
    result_cd = @test_item.determine_result_code(5.6)
    assert_equal('B', result_cd, 'result code B minimum')
  end

  def test_result_cd_b_max
    result_cd = @test_item.determine_result_code(5.9)
    assert_equal('B', result_cd, 'result code B maximum')
  end

  def test_result_cd_c_min
    result_cd = @test_item.determine_result_code(6.0)
    assert_equal('C', result_cd, 'result code C minimum')
  end

  def test_result_cd_c_max
    result_cd = @test_item.determine_result_code(6.4)
    assert_equal('C', result_cd, 'result code C maximum')
  end

  def test_result_cd_d
    result_cd = @test_item.determine_result_code(6.5)
    assert_equal('D', result_cd, 'result code D')
  end
end
