require_relative '../nameable'

class BaseDecorator < Nameable
  def initialize(nameable_obj)
    super()
    @nameable = nameable_obj
  end

  def correct_name
    @nameable.correct_name
  end
end
