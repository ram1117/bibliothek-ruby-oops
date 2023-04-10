# frozen_string_literal: true

require './person'

class Student < Person
  def initialize(name = 'unknown', parent_permission = true, age, classroom)
    super(name, parent_permission, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
