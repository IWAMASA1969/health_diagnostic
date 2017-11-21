class NormalRange
  attr_reader :min, :max, :result_cd

  def initialize(min, max, result_cd)
    @min, @max, @result_cd = min, max, result_cd
  end

  def ==(other)
    self.min == other.min && self.max == other.max && self.result_cd == other.result_cd
  end
end
