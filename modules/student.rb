require_relative './person'
require 'json'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, parent_permission:, name: 'unknown')
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
