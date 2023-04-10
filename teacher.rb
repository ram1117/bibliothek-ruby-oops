# frozen_string_literal: true

require './person'

class Teacher < Person
  def initialize(
    name = 'undefined',
    parent_permission = false,
    age,
    specialization
  )
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
