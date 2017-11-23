require 'singleton'
require 'thread'

module HealthDiagnotic
  class TestItemFactory
    include Singleton

    def initialize
      @pool = {}
    end

    def [](test_item_key)
      m = Mutex.new
      m.synchronize {
        test_item = @pool[test_item_key]
        if not test_item
          test_item = TestItem.new(test_item_key)
          @pool[test_item_key] = test_item
        end
        test_item
      }
    end
  end
end
