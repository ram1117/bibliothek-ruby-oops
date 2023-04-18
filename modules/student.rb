require_relative './person'
require 'json'

class Student < Person
  attr_reader :classroom

  def initialize(id:, age:, classroom:, parent_permission:, name: 'unknown')
    super(id: id, name: name, parent_permission: parent_permission, age: age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_json
    student_hash =
      Hash[
        type: 'student',
        age: @age,
        name: @name,
        parent_permission: @parent_permission,
        class: @class,
        id: @id
      ]
    JSON.generate(student_hash)
  end
end
