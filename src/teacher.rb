require './person'

class Teacher < Person
  def initialize(
    age:,
    specialization:,
    name: 'undefined',
    parent_permission: false
  )
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
