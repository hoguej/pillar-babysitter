class OverlappingDateRangesError < RuntimeError
  def initialize(msg = "The date ranges should not overlap")
    super
  end
end