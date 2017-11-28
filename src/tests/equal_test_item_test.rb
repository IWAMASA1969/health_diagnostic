Dir.glob(File.join('.', '**', 'health_diagnostic/*.rb')).each do |file|
  require file
end

require 'minitest/autorun'

class EqualTestItemTest < Minitest::Test
  def setup
    @test_item_key = HealthDiagnotic::TestItemKey.new('ProteinInUrine', :male)
    @test_item =
      HealthDiagnotic::TestItemFriweightFactory.instance[@test_item_key]
  end

  def test_result_cd_a
    result_cd = @test_item.determine_result_code('-')
    assert_equal('A', result_cd, 'result code A')
  end

  def test_result_cd_b
    result_cd = @test_item.determine_result_code('+')
    assert_equal('B', result_cd, 'result code B')
  end

  def test_result_cd_c
    result_cd = @test_item.determine_result_code('2+')
    assert_equal('C', result_cd, 'result code C')
  end

  def test_result_cd_d
    result_cd = @test_item.determine_result_code('3+')
    assert_equal('D', result_cd, 'result code D')
  end

  def test_result_cd_d_over
    result_cd = @test_item.determine_result_code('4+')
    assert_equal('D', result_cd, 'result code D')
  end
end
