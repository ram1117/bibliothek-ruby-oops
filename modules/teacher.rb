require './person'

class Teacher < Person
  def initialize(
    age:,
    specialization:,
    name: 'undefined',
    parent_permission: false
  )
    super(name: name, parent_permission: parent_permission, age: age)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
