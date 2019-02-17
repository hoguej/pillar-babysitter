class MustBePositiveIntegerError < ArgumentError
  def initialize(msg = "Expected a positive integer")
    super
  end
end