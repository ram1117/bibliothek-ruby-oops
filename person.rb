# frozen_string_literal: true

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = 'unknown', parent_permission = true, age)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    is_of_age ? true : @parent_permission
  end

  private

  def is_of_age
    age >= 18
  end
end
