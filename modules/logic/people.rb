require_relative '../student'
require_relative '../teacher'
require_relative '../validator'
require_relative '../process_json'
class People
  include Validator
  attr_accessor :people

  def initialize
    @people = []
    @person_file = ProccessJsonFile.new('person.json')
  end

  def add_person
    print 'Do you want to create a [1] Student or [2] Teacher?: '
    option = gets.chomp
    if option == '1'
      add_student
    elsif option == '2'
      add_teacher
    else
      print 'Please enter valid option: [1] or [2]'
    end
  end

  def add_student
    print 'Name: '
    name = validate_input_empty('Name: ')
    print 'Age: '
    age = validate_input_int('Age: ')
    print 'Classroom: '
    classroom = validate_input_empty('Classroom: ')
    print "Has parents' permission [Yy/Nn]: "
    yesorno = validate_input_boolean("Parents' permission [Yy/Nn]")
    @people.push Student.new(
      age: age,
      classroom: classroom,
      name: name.capitalize,
      parent_permission: %w[Y y].include?(yesorno)
    )
    print "Student added successfully!!! \n"
  end

  def add_teacher
    print 'Name: '
    name = validate_input_empty('Name: ')
    print 'Age: '
    age = validate_input_int('Age: ')
    print 'Specialization: '
    specialization = validate_input_empty('Specialization: ')
    @people.push Teacher.new(
      age: age,
      specialization: specialization.capitalize,
      name: name.capitalize
    )
    print "Teacher added successfully!!!\n"
  end

  def list_people
    if @people.empty?
      print "People list is empty! Please add some people\n"
    else
      @people.each_with_index.map do |person, index|
        if person.instance_of?(Student)
          str1 = "[#{index}] - [#{person.class}] - Id: #{person.id} , "
          str2 =
            " Name: #{person.name}, Age: #{person.age}, Class: #{person.classroom}\n"
        else
          str1 = "[#{index}] - [#{person.class}] - Id: #{person.id} ,"
          str2 =
            "  Name: #{person.name}, Age:  #{person.age}, Specialization: #{person.specialization}\n"
        end
        print str1 + str2
      end
    end
  end
  def load_people
    if @person_file.read_json
      @person_file.read_json.map do |person|
        if person['classroom']
          Student.new(person['age'], Classroom.new(person['classroom']), person['name'], person['permission'])
        else
          Teacher.new(person['age'], person['specialization'], person['name'])
        end
      end
    else
      []
    end
  end
end
