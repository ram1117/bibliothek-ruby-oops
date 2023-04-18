require_relative './person'
require 'json'

class Teacher < Person
  attr_reader :specialization

  def initialize(
    id:,
    age:,
    specialization:,
    name: 'undefined',
    parent_permission: true
  )
    super(id: id, name: name, parent_permission: parent_permission, age: age)
    @specialization = specialization
  end

  def can_use_services
    true
  end

  def to_json
    teacher_hash =
      Hash[
        type: 'teacher',
        age: @age,
        name: @name,
        parent_permission: @parent_permission,
        specialization: @specialization,
        id: @id
      ]
    JSON.generate(teacher_hash)
  end
end
