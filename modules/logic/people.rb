require_relative '../student'
require_relative '../teacher'
require_relative '../validator'
require_relative '../processjson'
class People
  include Validator
  attr_accessor :people

  def initialize
    @people = []
    @json_processor = ProcessJson.new('./data/people.json')
    load_people_from_file
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
                   id: Random.rand(1..10_000),
                   age: age,
                   classroom: classroom,
                   name: name.capitalize,
                   parent_permission: %w[Y y].include?(yesorno),
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
                   id: Random.rand(1..10_000),
                   age: age,
                   specialization: specialization.capitalize,
                   name: name.capitalize,
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
  def load_people_from_file
    people_data = @json_processor.read_data_from_file
    people_data.each do |persondata|
      if persondata['type'] == 'student'
        @people << Student.new(
          id: persondata['id'],
          age: persondata['age'],
          name: persondata['name'],
          parent_permission: persondata['parent_permission'],
          classroom: persondata['classroom'],
        )
      else
        @people << Teacher.new(
          id: persondata['id'],
          age: persondata['age'],
          name: persondata['name'],
          parent_permission: persondata['parent_permission'],
          specialization: persondata['specialization'],
        )
      end
    end
  end

  def write_file
    @json_processor.save_data_to_json(@people)
  end
end
