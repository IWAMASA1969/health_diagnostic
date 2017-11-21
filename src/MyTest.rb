require('./TestItem')
require('./NormalRange')

test_item = TestItem.new('H1Hblc', :male)
test_item << NormalRange.new(nil, 4.5, 'B')
test_item << NormalRange.new(4.6, 6.1, 'A')
test_item << NormalRange.new(6.2, 6.7, 'B')
test_item << NormalRange.new(6.8, 7.1, 'C')
test_item << NormalRange.new(7.2, nil, 'D')

puts test_item.determine_result_code(3)
puts test_item.determine_result_code(4.5)
puts test_item.determine_result_code(4.6)
puts test_item.determine_result_code(5.7)
puts test_item.determine_result_code(6.1)
puts test_item.determine_result_code(6.2)
puts test_item.determine_result_code(6.5)
puts test_item.determine_result_code(6.7)
puts test_item.determine_result_code(6.8)
puts test_item.determine_result_code(7)
puts test_item.determine_result_code(7.1)
puts test_item.determine_result_code(7.2)
puts test_item.determine_result_code(10)
puts test_item.be_under_treatment?
p test_item.normal_range

test_item2 = TestItem.new('H1Hblc', :males)
