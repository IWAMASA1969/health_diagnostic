module HealthDiagnotic

  class TestItemKey

    attr_reader :name, :sex

    def initialize(name, sex)
      @name = name
      @sex = check_sex(sex)
    end

    def eql?(other)
      name_eql?(other) && sex_eql?(other)
    end

    def hash
      [@name, @sex].hash
    end

    private

    def check_sex(sex)
      raise ArgumentError if sex != :male && sex != :female
    end

    def name_eql?(other)
      @name == other.name
    end

    def sex_eql?(other)
      @sex == other.sex
    end

  end
end
