require_relative './person'

class Student < Person
  def initialize(age:, classroom:, name: 'unknown', parent_permission: true)
    super(name: name, parent_permission: parent_permission, age: age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
