require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, name: 'unknown', parent_permission: true)
    super(name: name, parent_permission: parent_permission, age: age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
