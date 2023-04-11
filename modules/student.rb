require_relative './person'

class Student < Person
  attr_accessor :classroom
  def initialize(age:, classroom:, name: 'unknown', parent_permission: true)
    super(name: name, parent_permission: parent_permission, age: age)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
