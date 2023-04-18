require_relative './person'
require 'json'

class Teacher < Person
  attr_reader :specialization

  def initialize(
    age:,
    specialization:,
    name: 'undefined',
    parent_permission: true
  )
    super(name: name, parent_permission: parent_permission, age: age)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
