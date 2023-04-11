require_relative './nameable'
class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age:, name: 'unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def can_use_services?
    of_age? ? true : @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    age >= 18
  end
end
