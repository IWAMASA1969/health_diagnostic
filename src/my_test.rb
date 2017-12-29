Dir.glob(File.join('.', '**', 'health_diagnostic/*.rb')).each do |file|
  require file
end

test_item_key = HealthDiagnostic::TestItemKey.new('HbA1c', :male)
test_item = HealthDiagnostic::TestItemFactory.instance[test_item_key]
test_item1 = HealthDiagnostic::TestItemFactory.instance[test_item_key]

p test_item.object_id
p test_item1.object_id

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
